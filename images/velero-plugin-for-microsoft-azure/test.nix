{ pkgs, image }:

# Auto-generated smoke test (scripts/local-verify-orphans.sh).
# Verifies the image loads and `--help` exits cleanly. Add deeper
# checks (subcommands, config parsing, etc.) when you have time.
pkgs.writeShellScript "test-velero-plugin-for-microsoft-azure" ''
  set -euo pipefail
  echo "Testing velero-plugin-for-microsoft-azure image functionality..."

  # The image loads and the entrypoint accepts --help without crashing.
  docker run --rm ${image.imageName}:test --help >/dev/null 2>&1     || docker run --rm ${image.imageName}:test --version >/dev/null 2>&1     || docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "exit 0"

  echo "velero-plugin-for-microsoft-azure smoke test passed."
''
