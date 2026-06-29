{ pkgs, image }:

pkgs.writeShellScript "test-cluster-api-fips-1.9-controller" ''
  set -euo pipefail
  echo "Testing cluster-api-fips-1.9-controller image..."

  # Conservative smoke test: image loads, bundled shell works, root filesystem is present.
  # (This is a controller-manager / FIPS build; its runtime args are not asserted to avoid
  #  false CI failures from a manager that expects a live Kubernetes API.)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All cluster-api-fips-1.9-controller tests passed!"
''
