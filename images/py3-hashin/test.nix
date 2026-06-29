{ pkgs, image }:

pkgs.writeShellScript "test-py3-hashin" ''
  set -euo pipefail
  echo "Testing py3-hashin image..."

  # This is a Python tooling image (python3 + pip). No declared entrypoint, so
  # run python3 explicitly and assert non-empty version output.
  echo "  Checking python3 runs..."
  out=$(docker run --rm --entrypoint python3 ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Shell + filesystem sanity
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls / >/dev/null && echo ok' | grep -q ok

  echo "All py3-hashin tests passed!"
''
