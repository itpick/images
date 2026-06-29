{ pkgs, image }:

pkgs.writeShellScript "test-knative-eventing-channel-dispatcher" ''
  set -euo pipefail
  echo "Testing knative-eventing-channel-dispatcher image..."

  # Knative server component (entrypoint starts the controller/service).
  # Smoke test: shell runs and the component binary is present in the image.
  echo "  Checking shell and knative-eventing-channel-dispatcher binary are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v knative-eventing-channel-dispatcher >/dev/null 2>&1 || ls /nix/store/*/bin/knative-eventing-channel-dispatcher >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All knative-eventing-channel-dispatcher tests passed!"
''
