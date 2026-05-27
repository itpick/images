{ pkgs, image }:

# Real integration test: spin up the container, wait for pg_isready,
# run a query, tear down. Catches "image is empty" / "entrypoint is broken"
# in a way that --version + grep can't.
pkgs.writeShellScript "test-postgres-fips" ''
  set -euo pipefail

  IMAGE="${image.imageName}:test"
  CONTAINER="postgres-fips-test-$$"

  cleanup() { docker rm -f "$CONTAINER" >/dev/null 2>&1 || true; }
  trap cleanup EXIT

  echo "🧪 postgres-fips integration test"
  echo "  ✓ binaries on PATH"
  docker run --rm --entrypoint postgres "$IMAGE" --version | grep -q "PostgreSQL"
  docker run --rm --entrypoint psql "$IMAGE" --version | grep -q "psql"
  docker run --rm --entrypoint initdb "$IMAGE" --version | grep -q "initdb"

  # Stage an init script. Mounting this exercises the entrypoint's temp
  # pg_ctl path — previously broken because postgres' default
  # unix_socket_directories pointed at /run/postgresql (absent from the
  # nix-base image). The original test missed this by never mounting init.d.
  INITDIR=$(mktemp -d)
  trap 'cleanup; rm -rf "$INITDIR"' EXIT
  cat > "$INITDIR/01-extra-db.sql" <<'SQL'
  CREATE DATABASE extradb;
  GRANT ALL PRIVILEGES ON DATABASE extradb TO myuser;
  SQL

  # Hardened-compose simulation: cap-drop ALL and no-new-privileges, the
  # same security posture as F16PDA-Deploy / F16PDATool. Catches images
  # that need CAP_CHOWN at startup (which the previous root+su-exec design
  # required and broke in this configuration).
  echo "  ✓ starting container with POSTGRES_PASSWORD=testpw + init script + cap_drop=ALL"
  docker run -d --name "$CONTAINER" \
    --cap-drop=ALL \
    --security-opt no-new-privileges \
    -e POSTGRES_DB=mydb \
    -e POSTGRES_USER=myuser \
    -e POSTGRES_PASSWORD=testpw \
    -v "$INITDIR:/docker-entrypoint-initdb.d:ro" \
    "$IMAGE" >/dev/null

  echo "  ✓ waiting for pg_isready (up to 30s)"
  for i in $(seq 1 30); do
    if docker exec "$CONTAINER" pg_isready -U myuser -d mydb >/dev/null 2>&1; then
      break
    fi
    sleep 1
    if [ "$i" = "30" ]; then
      echo "FAIL: pg_isready never returned ok"
      docker logs "$CONTAINER" || true
      exit 1
    fi
  done

  echo "  ✓ querying as the configured superuser"
  result=$(docker exec "$CONTAINER" psql -U myuser -d mydb -tAc 'SELECT 42;' | tr -d '[:space:]')
  if [ "$result" != "42" ]; then
    echo "FAIL: expected '42' from query, got '$result'"
    docker logs "$CONTAINER" || true
    exit 1
  fi

  echo "  ✓ init script ran (extradb exists)"
  has_extradb=$(docker exec "$CONTAINER" psql -U myuser -d mydb -tAc \
    "SELECT 1 FROM pg_database WHERE datname = 'extradb';" | tr -d '[:space:]')
  if [ "$has_extradb" != "1" ]; then
    echo "FAIL: extradb not created — init script did not run"
    docker logs "$CONTAINER" || true
    exit 1
  fi

  echo "✅ All postgres-fips tests passed!"
''
