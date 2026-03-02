{ pkgs, image }:

pkgs.writeShellScript "test-nginx-unprivileged" ''
  set -euo pipefail

  echo "Testing nginx-unprivileged image..."

  echo "  Testing nginx -v..."
  docker run --rm --entrypoint nginx ${image.imageName}:test -v

  echo "  Testing service startup..."
  CONTAINER_ID=$(docker run -d --rm -p 8080:8080 ${image.imageName}:test nginx -g "daemon off;")
  trap "docker stop $CONTAINER_ID 2>/dev/null || true" EXIT

  for i in $(seq 1 30); do
    if curl -sf http://localhost:8080/ > /dev/null 2>&1; then
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

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^65532$"

  echo "All nginx-unprivileged tests passed!"
''
