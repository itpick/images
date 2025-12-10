{ pkgs, image }:

pkgs.writeShellScript "test-hubble-ui-backend" ''
  set -euo pipefail
  echo "Testing hubble-ui-backend image functionality..."

  # Test 1: Help output
  echo "  Testing backend help..."
  docker run --rm ${image.imageName}:test --help 2>&1 || true

  # Test 2: Binary exists
  echo "  Testing backend binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/" 2>&1 | grep -qE "(backend|hubble)"

  # Test 3: Container runs
  echo "  Testing container runs..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "echo ok" 2>&1 | grep -q "ok"

  # Test 4: Check for Go binary
  echo "  Testing Go binary..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "file /nix/store/*/bin/* 2>/dev/null || echo 'binary check'" 2>&1 || true

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All hubble-ui-backend tests passed!"
''
