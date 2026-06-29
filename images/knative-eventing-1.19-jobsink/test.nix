{ pkgs, image }:

pkgs.writeShellScript "test-knative-eventing-1.19-jobsink" ''
  set -euo pipefail
  echo "Testing knative-eventing-1.19-jobsink image..."

  # Knative server component (entrypoint starts the controller/service).
  # Smoke test: shell runs and the component binary is present in the image.
  echo "  Checking shell and eventing-1.19-jobsink binary are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v eventing-1.19-jobsink >/dev/null 2>&1 || ls /nix/store/*/bin/eventing-1.19-jobsink >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All knative-eventing-1.19-jobsink tests passed!"
''
