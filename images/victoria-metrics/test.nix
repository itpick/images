{ pkgs, image }:

pkgs.writeShellScript "test-victoria-metrics" ''
  set -euo pipefail

  echo "Testing victoria-metrics image..."

  echo "  Testing victoria-metrics --version..."
  docker run --rm ${image.imageName}:test victoria-metrics --version

  echo "  Testing service startup..."
  CONTAINER_ID=$(docker run -d --rm -p 8428:8428 ${image.imageName}:test)
  trap "docker stop $CONTAINER_ID 2>/dev/null || true" EXIT

  for i in $(seq 1 30); do
    if curl -sf http://localhost:8428/health > /dev/null 2>&1; then
      echo "  Health check passed on attempt $i"
      break
    fi
    if [ "$i" -eq 30 ]; then
      echo "  FAIL: Health check did not pass within 30 seconds"
      docker logs "$CONTAINER_ID"
      exit 1
    fi
    sleep 1
  done

  echo "All victoria-metrics tests passed!"
''
