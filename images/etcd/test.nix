{ pkgs, image }:

pkgs.writeShellScript "test-etcd" ''
  set -euo pipefail
  echo "Testing etcd image functionality..."

  # Test 1: Version check
  echo "  Testing etcd version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "etcd Version: [0-9]+"

  # Test 2: Help output
  echo "  Testing etcd help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "etcd"

  # Test 3: etcdctl exists
  echo "  Testing etcdctl..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/etcdctl" 2>&1 | grep -q "etcdctl"

  # Test 4: Binary exists
  echo "  Testing etcd binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/etcd" 2>&1 | grep -q "etcd"

  # Test 5: User setup (should be root)
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=0|root)"

  echo "All etcd tests passed!"
''
