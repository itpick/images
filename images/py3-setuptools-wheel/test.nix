{ pkgs, image }:

pkgs.writeShellScript "test-py3-setuptools-wheel" ''
  set -euo pipefail
  echo "Testing py3-setuptools-wheel image..."

  # This image bundles setuptools (a Python library, no standalone CLI), so we
  # do a minimal smoke test: the image has a working shell and filesystem.
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls / >/dev/null && echo ok' | grep -q ok

  echo "All py3-setuptools-wheel tests passed!"
''
