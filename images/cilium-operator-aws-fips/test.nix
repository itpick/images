{ pkgs, image }:

pkgs.writeShellScript "test-cilium-operator-aws-fips" ''
  set -euo pipefail
  echo "Testing cilium-operator-aws-fips image..."

  # Conservative smoke test: the component binaries are long-running
  # daemons/operators, so we only assert the image has a working shell
  # and root filesystem (exit 0, expected output).
  echo "  Checking image shell and filesystem..."
  out=$(docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok')
  [ "$out" = "ok" ]

  echo "All cilium-operator-aws-fips tests passed!"
''
