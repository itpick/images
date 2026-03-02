{ pkgs, image }:

pkgs.writeShellScript "test-victoria-logs" ''
  set -euo pipefail

  echo "Testing victoria-logs image..."

  echo "  Testing victoria-logs --version..."
  docker run --rm ${image.imageName}:test victoria-logs --version

  echo "  Testing service startup..."
  CONTAINER_ID=$(docker run -d --rm -p 9428:9428 ${image.imageName}:test)
  trap "docker stop $CONTAINER_ID 2>/dev/null || true" EXIT

  for i in $(seq 1 30); do
    if curl -sf http://localhost:9428/health > /dev/null 2>&1; then
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

  echo "All victoria-logs tests passed!"
''
