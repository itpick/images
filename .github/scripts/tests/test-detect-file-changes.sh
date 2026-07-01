#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT="$SCRIPT_DIR/../detect-file-changes.sh"

# Fixture: pretend the repo has these two images discovered
export FULL_MATRIX='{"include":[{"name":"postgres-fips","path":"images/postgres-fips/"},{"name":"redis","path":"images/redis/"}]}'

PASS=0
FAIL=0

assert_eq() {
  local name="$1" expected="$2" actual="$3"
  # Normalize via jq so key ordering doesn't matter
  local exp_norm act_norm
  exp_norm=$(printf '%s' "$expected" | jq -cS .)
  act_norm=$(printf '%s' "$actual" | jq -cS .)
  if [ "$exp_norm" = "$act_norm" ]; then
    printf 'PASS: %s\n' "$name"
    PASS=$((PASS + 1))
  else
    printf 'FAIL: %s\n' "$name"
    printf '  expected: %s\n' "$exp_norm"
    printf '  actual:   %s\n' "$act_norm"
    FAIL=$((FAIL + 1))
  fi
}

run() {
  # $1 = newline-separated changed paths
  printf '%s' "$1" | "$SCRIPT"
}

# --- Tests ---

test_per_image_single() {
  local out
  out=$(run "images/postgres-fips/test.nix")
  assert_eq "per-image single file" \
    '{"changes-detected":"true","changed-images":{"include":[{"name":"postgres-fips","path":"images/postgres-fips/"}]},"rebuild-all":"false"}' \
    "$out"
}

test_per_image_single

test_per_image_multiple() {
  local out
  out=$(run "images/postgres-fips/default.nix
images/redis/default.nix")
  assert_eq "per-image multiple files" \
    '{"changes-detected":"true","changed-images":{"include":[{"name":"postgres-fips","path":"images/postgres-fips/"},{"name":"redis","path":"images/redis/"}]},"rebuild-all":"false"}' \
    "$out"
}

test_per_image_dedup() {
  local out
  out=$(run "images/postgres-fips/default.nix
images/postgres-fips/test.nix
images/postgres-fips/docker-entrypoint.sh")
  assert_eq "per-image de-dup multiple files in same image" \
    '{"changes-detected":"true","changed-images":{"include":[{"name":"postgres-fips","path":"images/postgres-fips/"}]},"rebuild-all":"false"}' \
    "$out"
}

test_per_image_unknown_filtered() {
  # images/deleted-foo/ no longer exists in FULL_MATRIX — must be dropped
  local out
  out=$(run "images/deleted-foo/default.nix
images/postgres-fips/test.nix")
  assert_eq "per-image unknown name filtered out" \
    '{"changes-detected":"true","changed-images":{"include":[{"name":"postgres-fips","path":"images/postgres-fips/"}]},"rebuild-all":"false"}' \
    "$out"
}

test_per_image_multiple
test_per_image_dedup
test_per_image_unknown_filtered

test_shared_lib() {
  local out
  out=$(run "lib/categories.nix")
  assert_eq "shared lib/ -> rebuild-all" \
    '{"changes-detected":"true","changed-images":{"include":[]},"rebuild-all":"true"}' \
    "$out"
}

# The overlay index itself (pkgs/default.nix) can restructure the whole attr
# set, so a change there still triggers rebuild-all.
test_pkgs_default_nix_rebuild_all() {
  local out
  out=$(run "pkgs/default.nix")
  assert_eq "pkgs/default.nix (overlay index) -> rebuild-all" \
    '{"changes-detected":"true","changed-images":{"include":[]},"rebuild-all":"true"}' \
    "$out"
}

# A fixture repo where image `redis` consumes the overlay package built from
# pkgs/some-package (exposed as attr `myredis`), and `postgres-fips` does not.
_make_pkg_fixture() {
  local root; root=$(mktemp -d)
  mkdir -p "$root/pkgs" "$root/images/redis" "$root/images/postgres-fips"
  printf '{ pkgs }: {\n  myredis = pkgs.callPackage ./some-package { };\n}\n' > "$root/pkgs/default.nix"
  printf '{ mkImage, pkgs, ... }: mkImage { drv = pkgs.myredis; }\n' > "$root/images/redis/default.nix"
  printf '{ mkImage, pkgs, ... }: mkImage { drv = pkgs.postgresql; }\n' > "$root/images/postgres-fips/default.nix"
  printf '%s' "$root"
}

# A change to a specific overlay package rebuilds the images that consume it
# (resolved via pkgs/default.nix attr mapping + image references), NOT all.
test_pkgs_dependency_maps_to_consumers() {
  local root out
  root=$(_make_pkg_fixture)
  out=$(REPO_ROOT="$root" run "pkgs/some-package/default.nix")
  rm -rf "$root"
  assert_eq "pkgs/<dep> -> images that consume it" \
    '{"changes-detected":"true","changed-images":{"include":[{"name":"redis","path":"images/redis/"}]},"rebuild-all":"false"}' \
    "$out"
}

# A changed overlay package with no consumers in the discovered matrix yields
# no rebuilds (and definitely not rebuild-all).
test_pkgs_dependency_no_consumers() {
  local root out
  root=$(_make_pkg_fixture)
  out=$(REPO_ROOT="$root" run "pkgs/orphan-package/default.nix")
  rm -rf "$root"
  assert_eq "pkgs/<dep> with no consumers -> no changes" \
    '{"changes-detected":"false","changed-images":{"include":[]},"rebuild-all":"false"}' \
    "$out"
}

test_shared_bundler() {
  local out
  out=$(run "bundler/foo.nix")
  assert_eq "shared bundler/ -> rebuild-all" \
    '{"changes-detected":"true","changed-images":{"include":[]},"rebuild-all":"true"}' \
    "$out"
}

test_shared_flake_lock() {
  local out
  out=$(run "flake.lock")
  assert_eq "shared flake.lock -> rebuild-all" \
    '{"changes-detected":"true","changed-images":{"include":[]},"rebuild-all":"true"}' \
    "$out"
}

test_shared_flake_nix() {
  local out
  out=$(run "flake.nix")
  assert_eq "shared flake.nix -> rebuild-all" \
    '{"changes-detected":"true","changed-images":{"include":[]},"rebuild-all":"true"}' \
    "$out"
}

test_shared_root_nix() {
  local out
  out=$(run "chart-image-mapping.nix")
  assert_eq "shared root *.nix -> rebuild-all" \
    '{"changes-detected":"true","changed-images":{"include":[]},"rebuild-all":"true"}' \
    "$out"
}

test_shared_lib
test_pkgs_default_nix_rebuild_all
test_pkgs_dependency_maps_to_consumers
test_pkgs_dependency_no_consumers
test_shared_bundler
test_shared_flake_lock
test_shared_flake_nix
test_shared_root_nix

test_ignored_readme() {
  local out
  out=$(run "README.md")
  assert_eq "ignored README.md" \
    '{"changes-detected":"false","changed-images":{"include":[]},"rebuild-all":"false"}' \
    "$out"
}

test_ignored_docs() {
  local out
  out=$(run "docs/superpowers/specs/foo.md")
  assert_eq "ignored docs/" \
    '{"changes-detected":"false","changed-images":{"include":[]},"rebuild-all":"false"}' \
    "$out"
}

test_ignored_workflows() {
  local out
  out=$(run ".github/workflows/foo.yml")
  assert_eq "ignored .github/" \
    '{"changes-detected":"false","changed-images":{"include":[]},"rebuild-all":"false"}' \
    "$out"
}

test_ignored_website() {
  local out
  out=$(run "website/index.html")
  assert_eq "ignored website/" \
    '{"changes-detected":"false","changed-images":{"include":[]},"rebuild-all":"false"}' \
    "$out"
}

test_ignored_root_json() {
  local out
  out=$(run "package-versions.json")
  assert_eq "ignored root *.json" \
    '{"changes-detected":"false","changed-images":{"include":[]},"rebuild-all":"false"}' \
    "$out"
}

test_mixed_shared_wins() {
  # When a shared path AND a per-image path both change, rebuild-all wins
  local out
  out=$(run "lib/foo.nix
images/postgres-fips/test.nix")
  assert_eq "mixed shared + per-image -> rebuild-all wins" \
    '{"changes-detected":"true","changed-images":{"include":[]},"rebuild-all":"true"}' \
    "$out"
}

test_mixed_image_plus_ignored() {
  # Ignored files don't affect per-image result
  local out
  out=$(run "README.md
images/postgres-fips/test.nix")
  assert_eq "mixed per-image + ignored" \
    '{"changes-detected":"true","changed-images":{"include":[{"name":"postgres-fips","path":"images/postgres-fips/"}]},"rebuild-all":"false"}' \
    "$out"
}

test_empty_input() {
  local out
  out=$(run "")
  assert_eq "empty input" \
    '{"changes-detected":"false","changed-images":{"include":[]},"rebuild-all":"false"}' \
    "$out"
}

test_full_matrix_path() {
  # When FULL_MATRIX_PATH is set, script reads matrix from that file instead
  # of the FULL_MATRIX env var. CI uses this path to avoid E2BIG when the
  # matrix exceeds the kernel's ARG_MAX (repo has thousands of images).
  local tmpfile out
  tmpfile=$(mktemp)
  printf '%s' "$FULL_MATRIX" > "$tmpfile"
  out=$(printf '%s' "images/postgres-fips/test.nix" | env -u FULL_MATRIX FULL_MATRIX_PATH="$tmpfile" "$SCRIPT")
  rm -f "$tmpfile"
  assert_eq "FULL_MATRIX_PATH file-based matrix loading" \
    '{"changes-detected":"true","changed-images":{"include":[{"name":"postgres-fips","path":"images/postgres-fips/"}]},"rebuild-all":"false"}' \
    "$out"
}

test_ignored_readme
test_ignored_docs
test_ignored_workflows
test_ignored_website
test_ignored_root_json
test_mixed_shared_wins
test_mixed_image_plus_ignored
test_empty_input
test_full_matrix_path

printf '\n%d passed, %d failed\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
