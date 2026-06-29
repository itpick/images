{ pkgs, image }:

pkgs.writeShellScript "test-nvidia-container-toolkit" ''
  set -euo pipefail
  echo "Testing nvidia-container-toolkit image..."

  # 1. Entrypoint (nvidia-ctk) runs help and prints non-empty output
  echo "  Checking nvidia-ctk runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nvidia-ctk binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls /nix/store/*/bin/nvidia-ctk >/dev/null 2>&1 && echo ok' | grep -q ok

  echo "All nvidia-container-toolkit tests passed!"
''
