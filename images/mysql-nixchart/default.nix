{ mkImage, pkgs, lib, ... }:

# mysql-nixchart
# ==============
# MariaDB 11.4.12 (nixpkgs) presented under the mysql-nixchart name for
# the charts/mysql chart. MariaDB is a drop-in replacement for MySQL —
# same wire protocol, same commands, same env-var conventions.
#
# Small entrypoint wrapper translates the chart's MYSQL_* env vars into
# a first-run initdb + user setup, then execs mysqld.
#
# Supported:
#   MYSQL_ROOT_USER        (default: root)
#   MYSQL_ROOT_PASSWORD    (required unless MYSQL_ALLOW_EMPTY_PASSWORD=yes)
#   MYSQL_DATABASE         (initial database)
#   MYSQL_USER             (non-root app user)
#   MYSQL_PASSWORD         (non-root app user password)
#   MYSQL_PORT             (default 3306)
#   MYSQL_EXTRA_FLAGS      (extra mysqld args)
#
# Out of scope: replication mode, TLS auto-provisioning, LDAP.

let
  version = pkgs.mariadb.version;
  entrypoint = pkgs.writeShellScript "mysql-entrypoint" ''
    set -euo pipefail
    export PATH="${pkgs.mariadb}/bin:${pkgs.coreutils}/bin:$PATH"

    # Default data dir under /tmp so bare `docker run` / kind smoke can
    # bootstrap without a mounted PV; chart overrides to its PVC path.
    DATA_DIR="''${MYSQL_DATA_DIR:-/tmp/mysql-data}"
    PORT="''${MYSQL_PORT:-3306}"
    MYSQL_ROOT_USER="''${MYSQL_ROOT_USER:-root}"

    # /etc/passwd lookup: mariadb-install-db calls `id -un` which needs
    # an entry for UID 1001. Chart provides via securityContext.
    export USER="''${USER:-mysql}"

    mkdir -p "$DATA_DIR"

    if [ -z "$(ls -A "$DATA_DIR" 2>/dev/null)" ]; then
      # Smoke-test friendly default: allow empty root password. Chart pins
      # MYSQL_ROOT_PASSWORD via secret; MYSQL_ALLOW_EMPTY_PASSWORD=no still
      # enforces the requirement.
      if [ -z "''${MYSQL_ROOT_PASSWORD:-}" ] && [ "''${MYSQL_ALLOW_EMPTY_PASSWORD:-}" = "no" ]; then
        echo "mysql-nixchart: MYSQL_ROOT_PASSWORD is required (MYSQL_ALLOW_EMPTY_PASSWORD=no set)" >&2
        exit 1
      fi

      ${pkgs.mariadb}/bin/mariadb-install-db \
        --user="$USER" \
        --datadir="$DATA_DIR" \
        --auth-root-authentication-method=normal >/dev/null

      # Start mariadb temporarily to seed users/db. --socket redirects
      # the unix socket from the baked-in /run/mysqld default (not
      # writable at UID 1001) to a path under DATA_DIR.
      SEED_SOCK="$DATA_DIR/mysql.sock"
      ${pkgs.mariadb}/bin/mariadbd --datadir="$DATA_DIR" --socket="$SEED_SOCK" --skip-networking &
      pid=$!
      # Wait for socket
      for _ in $(seq 1 30); do
        [ -S "$DATA_DIR/mysql.sock" ] && break
        sleep 1
      done

      if [ -n "''${MYSQL_ROOT_PASSWORD:-}" ]; then
        ${pkgs.mariadb}/bin/mariadb --socket="$DATA_DIR/mysql.sock" -e "
          ALTER USER '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
          CREATE USER '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
          GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ROOT_USER'@'%' WITH GRANT OPTION;
          FLUSH PRIVILEGES;"
      fi

      if [ -n "''${MYSQL_DATABASE:-}" ]; then
        ${pkgs.mariadb}/bin/mariadb --socket="$DATA_DIR/mysql.sock" -e "
          CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;"
        if [ -n "''${MYSQL_USER:-}" ]; then
          ${pkgs.mariadb}/bin/mariadb --socket="$DATA_DIR/mysql.sock" -e "
            CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY "''${MYSQL_PASSWORD:-}";
            GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';
            FLUSH PRIVILEGES;"
        fi
      fi

      kill "$pid"
      wait "$pid" 2>/dev/null || true
    fi

    # Default unix socket path lives under /run/mysqld which isn't
    # writable in this image; land it in the data dir instead. Chart
    # overrides via MYSQL_SOCKET if needed.
    SOCKET="''${MYSQL_SOCKET:-$DATA_DIR/mysql.sock}"

    exec ${pkgs.mariadb}/bin/mariadbd \
      --datadir="$DATA_DIR" \
      --port="$PORT" \
      --bind-address=0.0.0.0 \
      --socket="$SOCKET" \
      ''${MYSQL_EXTRA_FLAGS:-} \
      "$@"
  '';
  # /etc/passwd entry for the mysql user (UID 1001). mariadb refuses to
  # start as an unknown user; chart uses fsGroup, standalone runs don't.
  passwdEntry = pkgs.runCommand "mysql-nixchart-passwd" {} ''
    mkdir -p $out/etc
    cat > $out/etc/passwd <<'EOF'
    root:x:0:0:root:/root:/bin/bash
    mysql:x:1001:0:mysql:/var/lib/mysql:/bin/bash
    EOF
    cat > $out/etc/group <<'EOF'
    root:x:0:
    EOF
  '';

in
mkImage {
  drv = pkgs.buildEnv {
    name = "mysql-nixchart-env";
    paths = with pkgs; [ mariadb passwdEntry bash coreutils cacert tzdata ];
  };

  name = "mysql-nixchart";
  tag = "v${version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [];
  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "mysql-nixchart";
    "org.opencontainers.image.description" = "MariaDB (MySQL-compatible) tuned for the nix-containers charts/mysql chart";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "mysql";
  };
}
