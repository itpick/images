{ pkgs, image }:

pkgs.writeShellScript "test-openfga" ''
  set -euo pipefail

  echo "Testing openfga image..."

  echo "  Testing openfga version..."
  docker run --rm ${image.imageName}:test openfga version

  echo "  Testing service startup..."
  CONTAINER_ID=$(docker run -d --rm -p 8080:8080 ${image.imageName}:test openfga run --playground-enabled=false)
  trap "docker stop $CONTAINER_ID 2>/dev/null || true" EXIT

  for i in $(seq 1 30); do
    if curl -sf http://localhost:8080/healthz > /dev/null 2>&1; then
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

  echo "All openfga tests passed!"
''
