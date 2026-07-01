{ mkImage, pkgs, lib, ... }:

# postgres-repmgr-nixchart
# ========================
# PostgreSQL + EnterpriseDB/repmgr — the replication manager used by
# charts/postgresql-ha for automatic failover. repmgr ships as a
# Postgres extension (.so under pkg_libdir) plus a `repmgr` CLI and
# `repmgrd` daemon.
#
# Not in nixpkgs, so we build it here as a PGXS extension against
# pkgs.postgresql (see the `repmgr` derivation below).

let
  postgres = pkgs.postgresql;

  # nixpkgs' postgres is built with clang and PGXS bakes the same
  # compiler into extension recipes; use clangStdenv so clang is on PATH.
  repmgr = pkgs.clangStdenv.mkDerivation rec {
    pname = "repmgr";
    version = "5.5.0";

    src = pkgs.fetchFromGitHub {
      owner = "EnterpriseDB";
      repo = "repmgr";
      rev = "v${version}";
      hash = "sha256-E9XMUvv7GpuPqz5jvIBgxscLOMhnC0imbfQdOL2y8/s=";
    };

    nativeBuildInputs = [ postgres.pg_config pkgs.flex pkgs.bison ];
    buildInputs = [
      postgres
      pkgs.openssl
      pkgs.zlib
      pkgs.readline
      pkgs.libxml2
      pkgs.libxslt
      pkgs.json_c
      pkgs.curl.dev
      pkgs.pam
      pkgs.libkrb5
    ];

    makeFlags = [ "USE_PGXS=1" ];

    installPhase = ''
      runHook preInstall
      make USE_PGXS=1 DESTDIR=$out install
      # PGXS mirrors the install layout under $out/${postgres}/…; flatten
      # so bin/lib/share land at the store root.
      if [ -d "$out/${postgres}" ]; then
        cp -r $out/${postgres}/. $out/
        rm -rf $out/nix
      fi
      runHook postInstall
    '';

    meta = {
      description = "Replication manager for PostgreSQL clusters";
      homepage = "https://repmgr.org";
      license = lib.licenses.gpl3;
    };
  };

  # Entrypoint dispatches on the first arg. `postgres` gets full first-run
  # initdb + start (mirrors postgres-nixchart's behavior) so kubectl smoke
  # tests and `docker run` come up green. `repmgr` / `repmgrd` (used by
  # the chart's ha-cluster StatefulSet) exec through untouched.
  entrypoint = pkgs.writeShellScript "postgres-repmgr-entrypoint" ''
    set -euo pipefail

    if [ "''${1:-}" = "postgres" ]; then
      shift
      # Default PGDATA lives under /tmp so a bare `docker run` / kind smoke
      # test can initdb without a mounted PV. The chart overrides PGDATA
      # to its PVC mount path.
      export PGDATA="''${PGDATA:-/tmp/pgdata}"
      export POSTGRES_USER="''${POSTGRES_USER:-postgres}"
      export POSTGRES_DB="''${POSTGRES_DB:-$POSTGRES_USER}"
      mkdir -p "$PGDATA"

      if [ -z "$(ls -A "$PGDATA" 2>/dev/null)" ]; then
        # First-run: default to trust auth so smoke tests work without a
        # password. The chart overrides via POSTGRES_HOST_AUTH_METHOD=md5
        # + a POSTGRES_PASSWORD secret when it wants real auth.
        AUTH_METHOD="''${POSTGRES_HOST_AUTH_METHOD:-trust}"
        if [ -n "''${POSTGRES_PASSWORD:-}" ]; then
          ${postgres}/bin/initdb \
            --username="$POSTGRES_USER" \
            --auth="$AUTH_METHOD" \
            --pwfile=<(printf '%s' "$POSTGRES_PASSWORD") \
            --pgdata="$PGDATA"
        else
          ${postgres}/bin/initdb \
            --username="$POSTGRES_USER" \
            --auth="$AUTH_METHOD" \
            --pgdata="$PGDATA"
        fi
      fi

      # unix_socket_directories under /tmp; the default /run/postgresql
      # isn't writable in this image (no /run tmpfs mounted). Chart pods
      # can override via POSTGRES_UNIX_SOCKET_DIR or extra `-c` args.
      exec ${postgres}/bin/postgres \
        -D "$PGDATA" \
        -c listen_addresses='*' \
        -c unix_socket_directories="''${POSTGRES_UNIX_SOCKET_DIR:-/tmp}" \
        "$@"
    fi

    # Non-postgres cmd (repmgr, repmgrd, psql, sh, etc.) — exec through.
    exec "$@"
  '';

  # initdb refuses to run when getpwuid() has no entry for the effective
  # UID. Ship a minimal /etc/passwd + /etc/group so postgres:1001 resolves.
  # (The chart's k8s pod securityContext usually solves this via fsGroup,
  # but standalone `docker run` and kind smoke tests don't get that.)
  passwdEntry = pkgs.runCommand "postgres-repmgr-passwd" {} ''
    mkdir -p $out/etc
    cat > $out/etc/passwd <<'EOF'
    root:x:0:0:root:/root:/bin/bash
    postgres:x:1001:0:postgres:/var/lib/postgresql:/bin/bash
    EOF
    cat > $out/etc/group <<'EOF'
    root:x:0:
    EOF
  '';

in
mkImage {
  drv = pkgs.buildEnv {
    name = "postgres-repmgr-nixchart-env";
    paths = [
      postgres
      repmgr
      passwdEntry
      pkgs.bash
      pkgs.coreutils
      pkgs.cacert
      pkgs.gnutar
      pkgs.gzip
      pkgs.gnused
      pkgs.gnugrep
    ];
    # postgres + repmgr both ship files under share/; allow overlap.
    ignoreCollisions = true;
  };
  name = "postgres-repmgr-nixchart";
  tag = "v${repmgr.version}";
  entrypoint = [ "${entrypoint}" ];
  cmd = [ "postgres" ];
  user = "1001:0";
  labels = {
    "org.opencontainers.image.title" = "postgres-repmgr-nixchart";
    "org.opencontainers.image.description" = "PostgreSQL ${postgres.version} + repmgr ${repmgr.version} for charts/postgresql-ha";
    "org.opencontainers.image.version" = repmgr.version;
    "io.nix-containers.chart" = "postgresql-ha";
  };
}
