{ pkgs, image }:

pkgs.writeShellScript "test-docker-selenium-distributor" ''
  set -euo pipefail
  echo "Testing docker-selenium-distributor image..."

  # 1. Docker client runs and reports its version (exit 0, non-empty output)
  echo "  Checking docker client runs..."
  out=$(docker run --rm --entrypoint docker ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. docker binary present in image (shell + coreutils are bundled)
  echo "  Checking docker binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v docker >/dev/null 2>&1 || ls /nix/store/*/bin/docker >/dev/null 2>&1'

  echo "All docker-selenium-distributor tests passed!"
''
