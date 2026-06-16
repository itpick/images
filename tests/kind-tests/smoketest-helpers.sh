#!/bin/sh
# Reusable assertions for per-image smoketest.sh files.
#
# When an image ships `images/<name>/smoketest.sh`, the kind workflow
# mounts the image's smoketest.sh AND this helpers file into a single
# ConfigMap, so the script can do:
#
#   . /smoketest/helpers.sh
#
# at the top and then use the assertions below. Every assertion exits
# the calling script (via `set -e` propagation) on failure; success is
# silent so the script's own progress markers are the readable signal.
#
# What this captures: the categorical bugs we hit during the dev
# nix-containers swap rollout, made cheap to reassert on every CI
# build going forward.

# assert_path_exists PATH [KIND]
# Verifies PATH exists in the image rootfs. KIND is one of:
#   file / link / dir / executable (default: any kind).
assert_path_exists() {
  p=$1
  kind=${2:-}
  if [ ! -e "$p" ]; then
    echo "ASSERT FAIL: missing path '$p'"
    return 1
  fi
  case "$kind" in
    file)       [ -f "$p" ] || { echo "ASSERT FAIL: '$p' is not a regular file"; return 1; } ;;
    link)       [ -L "$p" ] || { echo "ASSERT FAIL: '$p' is not a symlink"; return 1; } ;;
    dir)        [ -d "$p" ] || { echo "ASSERT FAIL: '$p' is not a directory"; return 1; } ;;
    executable) [ -x "$p" ] || { echo "ASSERT FAIL: '$p' is not executable"; return 1; } ;;
  esac
}

# assert_chart_cmd_paths PATH ...
# For each PATH, assert it exists AND is executable. Use for the chart-
# hardcoded paths that drop-in upstream replacements MUST expose, e.g.:
#   /vmauth-prod         (victoriametrics chart)
#   /keda                (keda chart operator)
#   /keda-adapter        (keda chart metrics-apiserver)
#   /keda-admission-webhooks  (keda chart admission)
#   /usr/local/bin/healthcheck.sh  (dragonfly chart probes)
# Surfaced as `exec: "<path>": no such file or directory` at pod start
# when the image lacked the symlink.
assert_chart_cmd_paths() {
  for p in "$@"; do
    assert_path_exists "$p" executable
  done
}

# assert_user "UID:GID"
# Verify the running container is the expected UID:GID. Catches the
# victoria-logs / victoria-metrics class of bug where switching to a
# non-root user broke flock acquisition on PVCs that were initialized
# by the upstream root-running image.
assert_user() {
  exp=$1
  got="$(id -u):$(id -g)"
  if [ "$got" != "$exp" ]; then
    echo "ASSERT FAIL: running as $got, expected $exp"
    return 1
  fi
}

# assert_tool_variant TOOL PATTERN
# Run `TOOL --version` and grep for PATTERN. Catches the wrong-variant-
# silently-installed bug pattern (e.g. Python jq-wrapper yq shipped
# instead of Go mikefarah yq).
assert_tool_variant() {
  tool=$1
  pattern=$2
  if ! "$tool" --version 2>&1 | grep -q -- "$pattern"; then
    echo "ASSERT FAIL: '$tool --version' did not match '$pattern'"
    return 1
  fi
}

# assert_python_imports MODULES ...
# Try to import each module via python3 and bail on ModuleNotFoundError.
# Catches the k8s-sidecar pattern (logfmter / python-json-logger missing
# from the python.withPackages list).
assert_python_imports() {
  script=""
  for m in "$@"; do
    script="${script}import $m
"
  done
  python3 -c "$script"
}

# assert_help_runs CMD [ARGS...]
# Run CMD with given args (typically `--help`) and require exit 0 plus
# non-empty stdout. Catches "binary present but linkage broken" and
# similar load-time failures.
assert_help_runs() {
  out=$("$@" 2>&1)
  rc=$?
  if [ "$rc" -ne 0 ]; then
    echo "ASSERT FAIL: '$*' exited $rc"
    echo "$out" | head -10
    return 1
  fi
  if [ -z "$out" ]; then
    echo "ASSERT FAIL: '$*' produced no output"
    return 1
  fi
}
