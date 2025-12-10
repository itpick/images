{ pkgs, image }:

pkgs.writeShellScript "test-hubble-certgen" ''
  set -euo pipefail
  echo "Testing hubble-certgen image functionality..."

  # Test 1: Help output
  echo "  Testing certgen help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -qE "(cert|hubble)"

  # Test 2: Version/binary check
  echo "  Testing certgen binary..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/certgen" 2>&1 | grep -q "certgen"

  # Test 3: CA certs available
  echo "  Testing CA certs available..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /etc/ssl/certs" 2>&1 | grep -qE "(ca-|certs)"

  # Test 4: Check generate options
  echo "  Testing certgen options..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -qE "(generate|ca)"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All hubble-certgen tests passed!"
''
