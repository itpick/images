{ mkImage, pkgs, lib, ... }:

# postgres-repmgr-nixchart
# ========================
# PostgreSQL + EnterpriseDB/repmgr — the replication manager used by
# charts/postgresql-ha for automatic failover. repmgr is a Postgres
# extension (installed as .so under pkg_libdir plus a `repmgr` CLI).
#
# Not in nixpkgs, so we build it here as a PGXS extension against
# pkgs.postgresql.

let
  postgres = pkgs.postgresql;

  # nixpkgs' postgresql is built with clang, and PGXS bakes the same
  # compiler into the extension build recipes. Use clangStdenv so
  # `clang` is on PATH during `make`.
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

    # PGXS wants pg_config on PATH; nativeBuildInputs already puts it there.
    makeFlags = [ "USE_PGXS=1" ];

    installPhase = ''
      runHook preInstall
      # DESTDIR redirects install paths under $out; the pg install layout
      # ends up mirrored under $out/${postgres} — flatten to $out root.
      make USE_PGXS=1 DESTDIR=$out install
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

  entrypoint = pkgs.writeShellScript "postgres-repmgr-entrypoint" ''
    set -e
    # The chart's stateful set runs `repmgr` for cluster registration
    # and starts postgres separately. Default cmd is `postgres` so the
    # container behaves like a stock postgres image; chart pods override
    # to `repmgr <subcommand>` where needed.
    exec "$@"
  '';

in
mkImage {
  drv = pkgs.buildEnv {
    name = "postgres-repmgr-nixchart-env";
    paths = [
      postgres
      repmgr
      pkgs.bash
      pkgs.coreutils
      pkgs.cacert
      pkgs.gnutar
      pkgs.gzip
      pkgs.gnused
      pkgs.gnugrep
    ];
    # postgres + repmgr both ship `pg_config` / share/ — allow overlap.
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
