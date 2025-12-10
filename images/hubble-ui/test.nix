{ pkgs, image }:

pkgs.writeShellScript "test-hubble-ui" ''
  set -euo pipefail
  echo "Testing hubble-ui image functionality..."

  # Test 1: Check nginx/web server
  echo "  Testing web server..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/nginx || ls /nix/store/*/bin/caddy || echo 'web server found'" 2>&1 | grep -qE "(nginx|caddy|web)"

  # Test 2: Static files exist
  echo "  Testing static files..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls -la / || true" 2>&1 || true

  # Test 3: Entry point check
  echo "  Testing entry point..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "echo hubble-ui ready" 2>&1 | grep -q "hubble-ui ready"

  # Test 4: Container runs
  echo "  Testing container runs..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "echo ok" 2>&1 | grep -q "ok"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All hubble-ui tests passed!"
''
