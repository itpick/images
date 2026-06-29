{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-dashboard-metrics-scraper" ''
  set -euo pipefail
  echo "Testing kubernetes-dashboard-metrics-scraper image..."

  # 1. Entrypoint binary runs a help/version command and prints non-empty output.
  #    Exit code is tolerated (flag parsers may exit non-zero on --help/--version).
  echo "  Checking dashboard-metrics-scraper runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking dashboard-metrics-scraper is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dashboard-metrics-scraper >/dev/null 2>&1 || ls /nix/store/*/bin/dashboard-metrics-scraper >/dev/null 2>&1'

  echo "All kubernetes-dashboard-metrics-scraper tests passed!"
''
