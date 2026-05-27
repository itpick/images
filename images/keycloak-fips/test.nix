{ pkgs, image }:

# Real integration test: start keycloak with an embedded in-memory dev
# datastore, wait for the admin REST endpoint to return 200, tear down.
# `start-dev` skips the build step and uses the H2 dev database so the
# test doesn't need a sibling postgres container. Catches "image is
# empty" / "JVM missing" / "entrypoint broken" in a way --version can't.
pkgs.writeShellScript "test-keycloak-fips" ''
  set -euo pipefail

  IMAGE="${image.imageName}:test"
  CONTAINER="keycloak-fips-test-$$"

  cleanup() { docker rm -f "$CONTAINER" >/dev/null 2>&1 || true; }
  trap cleanup EXIT

  echo "🧪 keycloak-fips integration test"

  # kc.sh-wrapped pipes through sed/xargs during startup. A `--help` invocation
  # runs that pipeline without needing a database, so it surfaces "command not
  # found" failures fast (the prior coreutils-only image fell over here even
  # though start-dev was permissive enough to mostly succeed).
  echo "  ✓ kc.sh --help runs without missing-command errors"
  help_out=$(docker run --rm --cap-drop=ALL --security-opt no-new-privileges \
    "$IMAGE" --help 2>&1 || true)
  case "$help_out" in
    *"command not found"*|*"No such file"*|*"Failed to create temporary file"*)
      echo "FAIL: kc.sh wrapper missing a runtime dependency"
      printf '%s\n' "$help_out" | head -40
      exit 1
      ;;
  esac

  # Hardened-compose simulation: cap-drop ALL + no-new-privileges, matching
  # the security posture of downstream consumers (F16PDATool / F16PDA-Deploy).
  echo "  ✓ starting keycloak in dev mode under cap_drop=ALL"
  docker run -d --name "$CONTAINER" \
    --cap-drop=ALL \
    --security-opt no-new-privileges \
    -p 0:8080 \
    -e KEYCLOAK_ADMIN=admin \
    -e KEYCLOAK_ADMIN_PASSWORD=ci_smoke_admin \
    "$IMAGE" start-dev --http-port=8080 >/dev/null

  # Resolve the random host port docker mapped.
  HOST_PORT=$(docker port "$CONTAINER" 8080 | head -1 | awk -F: '{print $NF}')
  if [ -z "$HOST_PORT" ]; then
    echo "FAIL: docker port mapping for 8080 not found"
    docker logs "$CONTAINER" || true
    exit 1
  fi
  echo "  ✓ mapped host port: $HOST_PORT"

  # Keycloak startup is slow (Quarkus init + schema bootstrap). Give it up
  # to 120s to start answering on /health/ready.
  echo "  ✓ waiting for /health/ready (up to 120s)"
  for i in $(seq 1 60); do
    if curl -fsS "http://127.0.0.1:''${HOST_PORT}/health/ready" >/dev/null 2>&1; then
      break
    fi
    sleep 2
    if [ "$i" = "60" ]; then
      echo "FAIL: /health/ready never returned 200"
      docker logs "$CONTAINER" || true
      exit 1
    fi
  done

  # Belt-and-suspenders: the JVM tempfile assertion was visible in logs even
  # when /health/ready eventually came up, so check explicitly.
  echo "  ✓ no startup-time tempfile or missing-binary errors in logs"
  log_dump=$(docker logs "$CONTAINER" 2>&1)
  case "$log_dump" in
    *"command not found"*|*"Failed to create temporary file"*)
      echo "FAIL: startup log contains a known-bad sentinel error"
      printf '%s\n' "$log_dump" | tail -40
      exit 1
      ;;
  esac

  echo "  ✓ /health/ready returns 200"

  # Sanity: hit the welcome page (root) and confirm we get HTML back.
  echo "  ✓ welcome page reachable"
  body=$(curl -fsS "http://127.0.0.1:''${HOST_PORT}/" | head -1)
  case "$body" in
    *html*|*HTML*|*"<!DOCTYPE"*) ;;
    *)
      echo "FAIL: welcome page did not return HTML (got: ''${body:0:120})"
      docker logs "$CONTAINER" || true
      exit 1
      ;;
  esac

  echo "✅ All keycloak-fips tests passed!"
''
