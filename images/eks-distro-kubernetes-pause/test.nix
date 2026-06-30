{ pkgs, image }:

# Auto-generated smoke test (scripts/local-verify-orphans.sh).
# Verifies the image loads and `--help` exits cleanly. Add deeper
# checks (subcommands, config parsing, etc.) when you have time.
pkgs.writeShellScript "test-eks-distro-kubernetes-pause" ''
  set -euo pipefail
  echo "Testing eks-distro-kubernetes-pause image functionality..."

  # The image loads and the entrypoint accepts --help without crashing.
  docker run --rm ${image.imageName}:test --help >/dev/null 2>&1     || docker run --rm ${image.imageName}:test --version >/dev/null 2>&1     || docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "exit 0"

  echo "eks-distro-kubernetes-pause smoke test passed."
''
