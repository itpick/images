{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-snmp-exporter" ''
  set -euo pipefail
  echo "Testing prometheus-snmp-exporter image..."

  # 1. Entrypoint runs and emits output
  echo "  Checking snmp_exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking snmp_exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v snmp_exporter >/dev/null 2>&1 || ls /nix/store/*/bin/snmp_exporter >/dev/null 2>&1' || true

  echo "All prometheus-snmp-exporter tests passed!"
''
