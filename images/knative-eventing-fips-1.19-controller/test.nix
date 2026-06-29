{ pkgs, image }:

pkgs.writeShellScript "test-knative-eventing-fips-1.19-controller" ''
  set -euo pipefail
  echo "Testing knative-eventing-fips-1.19-controller image..."

  # Knative server component (entrypoint starts the controller/service).
  # Smoke test: shell runs and the component binary is present in the image.
  echo "  Checking shell and eventing-fips-1.19-controller binary are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v eventing-fips-1.19-controller >/dev/null 2>&1 || ls /nix/store/*/bin/eventing-fips-1.19-controller >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All knative-eventing-fips-1.19-controller tests passed!"
''
