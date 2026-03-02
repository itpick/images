{ pkgs, image }:

pkgs.writeShellScript "test-grafana" ''
  set -euo pipefail

  echo "Testing grafana image..."

  echo "  Testing grafana server --version..."
  docker run --rm --entrypoint grafana ${image.imageName}:test server -v

  echo "  Testing service startup..."
  CONTAINER_ID=$(docker run -d --rm -p 3000:3000 ${image.imageName}:test)
  trap "docker stop $CONTAINER_ID 2>/dev/null || true" EXIT

  for i in $(seq 1 30); do
    if curl -sf http://localhost:3000/api/health > /dev/null 2>&1; then
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

  echo "All grafana tests passed!"
''
