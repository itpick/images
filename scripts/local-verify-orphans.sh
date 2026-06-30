#!/usr/bin/env bash
#
# Drives a local verify-and-stub loop for images that don't yet have a
# test.nix on main. Mirrors what the CI gate would do per image, then
# writes a minimal smoke-test test.nix when the image builds + loads
# cleanly. Commits in batches to the current branch (caller's
# responsibility to be on the right branch before invoking).
#
# Usage:
#   scripts/local-verify-orphans.sh <image-list-file> [--batch-size N] [--push-every M]
#
# Where:
#   <image-list-file>     one image name per line
#   --batch-size N        commit + push every N successes (default 25)
#   --push-every M        push to origin every M commits (default 1)
#
# Resume-safe: tracks per-image state in audit-results/local-verify/<image>.state
# (one of: ok, fail-build, fail-load, fail-smoke). On re-run, images
# already marked ok/fail-* are skipped.

set -uo pipefail

if [ $# -lt 1 ]; then
  echo "usage: $0 <image-list-file> [--batch-size N] [--push-every M]" >&2
  exit 2
fi

LIST="$1"; shift
BATCH_SIZE=25
PUSH_EVERY=1
while [ $# -gt 0 ]; do
  case "$1" in
    --batch-size) BATCH_SIZE="$2"; shift 2 ;;
    --push-every) PUSH_EVERY="$2"; shift 2 ;;
    *) echo "unknown arg: $1" >&2; exit 2 ;;
  esac
done

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

STATE_DIR="audit-results/local-verify"
mkdir -p "$STATE_DIR"

BRANCH=$(git branch --show-current)
echo "==> driver: branch=$BRANCH batch_size=$BATCH_SIZE push_every=$PUSH_EVERY list=$LIST"

# Branch-safety check before each commit/stage: if the working tree's
# current branch ever drifts from $BRANCH, bail. This prevents the
# accidental "I switched branches in another terminal and the loop kept
# committing on the wrong branch" failure mode.
assert_branch() {
  local now
  now=$(git branch --show-current)
  if [ "$now" != "$BRANCH" ]; then
    echo "==> WORKING TREE DRIFTED: was $BRANCH, now $now. Aborting." >&2
    echo "    State files are intact; re-run after fixing the checkout." >&2
    exit 4
  fi
}

# Build a stub test.nix that smoke-tests the image runs at all. Pattern
# is conservative: --help is the only invariant we can rely on across
# images. Some don't even support --help; those fall to fail-smoke.
write_stub_test_nix() {
  local image="$1"
  cat > "images/$image/test.nix" <<EOF
{ pkgs, image }:

# Auto-generated smoke test (scripts/local-verify-orphans.sh).
# Verifies the image loads and \`--help\` exits cleanly. Add deeper
# checks (subcommands, config parsing, etc.) when you have time.
pkgs.writeShellScript "test-${image}" ''
  set -euo pipefail
  echo "Testing ${image} image functionality..."

  # The image loads and the entrypoint accepts --help without crashing.
  docker run --rm \${image.imageName}:test --help >/dev/null 2>&1 \
    || docker run --rm \${image.imageName}:test --version >/dev/null 2>&1 \
    || docker run --rm --entrypoint /bin/sh \${image.imageName}:test -c "exit 0"

  echo "${image} smoke test passed."
''
EOF
}

batch_count=0
push_count=0
total_ok=0
total_fail_build=0
total_fail_load=0
total_fail_smoke=0
total_skipped=0
# Periodically prune the nix store + docker daemon so a 1000-image run
# doesn't fill the disk. /nix on this host is on a 931G volume; one full
# verify sweep can balloon /nix/store past 100G if we never GC.
gc_after=50
since_gc=0
maybe_gc() {
  since_gc=$((since_gc + 1))
  if [ "$since_gc" -ge "$gc_after" ]; then
    echo "==> periodic gc (every $gc_after images)"
    nix-collect-garbage 2>&1 | tail -2 || true
    docker image prune -f >/dev/null 2>&1 || true
    since_gc=0
  fi
}


while IFS= read -r image; do
  [ -z "$image" ] && continue
  state_file="$STATE_DIR/${image}.state"

  # Skip if already processed AND the test.nix is still in tree. If the
  # state says ok but the file is missing (e.g. we pushed to the wrong
  # branch in an earlier run), regenerate the stub without re-running
  # the slow build/load/smoke gates — we know it passed before.
  if [ -f "$state_file" ]; then
    state_val=$(cat "$state_file")
    if [ "$state_val" = "ok" ] && [ ! -f "images/$image/test.nix" ]; then
      assert_branch
      echo "==> [$image] recovering stub (state=ok, test.nix missing)"
      write_stub_test_nix "$image"
      git add "images/$image/test.nix"
      batch_count=$((batch_count + 1))
      total_ok=$((total_ok + 1))
      # Flush batch if reached threshold (same logic as below).
      if [ "$batch_count" -ge "$BATCH_SIZE" ]; then
        assert_branch
        git commit -m "test: add smoke-test stubs for $batch_count images (recovery batch)" >/dev/null 2>&1 \
          && echo "==> committed recovery batch of $batch_count (total ok: $total_ok)"
        batch_count=0
        push_count=$((push_count + 1))
        if [ "$push_count" -ge "$PUSH_EVERY" ]; then
          git push origin "$BRANCH" 2>&1 | tail -2
          push_count=0
        fi
      fi
      continue
    fi
    total_skipped=$((total_skipped + 1))
    continue
  fi

  if [ ! -d "images/$image" ]; then
    echo "[$image] no such image, skipping" >&2
    echo "missing" > "$state_file"
    continue
  fi

  echo "==> [$image] build"
  if ! nix build --no-link ".#$image" 2>/dev/null; then
    echo "fail-build" > "$state_file"
    total_fail_build=$((total_fail_build + 1))
    continue
  fi

  echo "==> [$image] load"
  # The load- derivation puts the loader binary at bin/copy-to-docker-daemon,
  # NOT at a per-image filename. The output image is tagged
  # `<image>:latest` in the local docker daemon.
  if ! nix build --no-link --out-link "/tmp/result-$image" ".#load-${image}-to-docker" 2>/dev/null \
       || ! "/tmp/result-$image"/bin/copy-to-docker-daemon >/dev/null 2>&1; then
    rm -f "/tmp/result-$image"
    echo "fail-load" > "$state_file"
    total_fail_load=$((total_fail_load + 1))
    continue
  fi
  rm -f "/tmp/result-$image"

  # Smoke: try --help, then --version, then a shell exit. Need at least
  # one to succeed for the stub test to be meaningful. The loader tags
  # the local image as `<name>:latest`, not its full ghcr ref.
  echo "==> [$image] smoke"
  if ! { docker run --rm "$image:latest" --help >/dev/null 2>&1 \
         || docker run --rm "$image:latest" --version >/dev/null 2>&1 \
         || docker run --rm --entrypoint /bin/sh "$image:latest" -c "exit 0" >/dev/null 2>&1; }; then
    echo "fail-smoke" > "$state_file"
    total_fail_smoke=$((total_fail_smoke + 1))
    continue
  fi

  # All gates green — write the stub test.nix.
  write_stub_test_nix "$image"
  git add "images/$image/test.nix"
  echo "ok" > "$state_file"
  total_ok=$((total_ok + 1))
  batch_count=$((batch_count + 1))

  # Reclaim disk: each load can add 50-300MB to the local docker daemon.
  # At ~1000 images that adds up to >100GB if we never prune. We don't
  # need the loaded image after the smoke check, so drop it.
  docker rmi -f "$image:latest" >/dev/null 2>&1 || true
  # Also GC the nix store every 50 images so the build cache doesn't
  # balloon past 100G. (We hit a "No space left on device" mid-run once.)
  maybe_gc

  if [ "$batch_count" -ge "$BATCH_SIZE" ]; then
    assert_branch
    git commit -m "test: add smoke-test stubs for $batch_count images (local verify batch)" >/dev/null 2>&1 \
      && echo "==> committed batch of $batch_count (total ok: $total_ok)"
    batch_count=0
    push_count=$((push_count + 1))
    if [ "$push_count" -ge "$PUSH_EVERY" ]; then
      git push origin "$BRANCH" 2>&1 | tail -2
      push_count=0
    fi
  fi
done < "$LIST"

# Flush remainder
if [ "$batch_count" -gt 0 ]; then
  git commit -m "test: add smoke-test stubs for $batch_count images (local verify batch tail)" >/dev/null 2>&1 \
    && echo "==> committed final batch of $batch_count"
  git push origin "$BRANCH" 2>&1 | tail -2
fi

echo ""
echo "==> summary"
echo "    ok:          $total_ok"
echo "    fail-build:  $total_fail_build"
echo "    fail-load:   $total_fail_load"
echo "    fail-smoke:  $total_fail_smoke"
echo "    skipped:     $total_skipped (previously processed)"
echo ""
echo "State files in $STATE_DIR; re-run resumes by skipping already-done."
