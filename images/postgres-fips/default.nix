{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postgres-fips
# Turnkey postgres container: docker-library-compatible entrypoint that
# runs initdb on first start, honors POSTGRES_DB/USER/PASSWORD env vars,
# and processes /docker-entrypoint-initdb.d/*.{sh,sql,sql.gz}.

let
  imagePkgs = with pkgs; [
    postgresql
    bash
    coreutils
    gzip
    su-exec
    cacert
    tzdata
  ];

  # Postgres runs as uid:gid 999:999. initdb does a getpwuid() lookup
  # against /etc/passwd and refuses to run without an entry, so we bake one
  # in (plus /etc/group, /tmp, /home/postgres) via the shared helper.
  postgresUser = {
    uid = 999;
    gid = 999;
    name = "postgres";
    home = "/home/postgres";
  };
  userEnv = nonRoot.mkCustomUserEnv pkgs postgresUser [];

  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = imagePkgs;
    text = builtins.readFile ./docker-entrypoint.sh;
    # Skip shellcheck inside writeShellApplication — the script has
    # intentional word-splitting on POSTGRES_INITDB_ARGS and the source
    # of /docker-entrypoint-initdb.d/*.sh is by design dynamic.
    excludeShellChecks = [ "SC2086" "SC1090" ];
  };

in nix2container.buildImage {
  name = "postgres-fips";
  tag = pkgs.postgresql.version;

  copyToRoot = [
    (buildEnv {
      name = "postgres-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ entrypoint userEnv ];
    })
  ];

  # Run as root so the entrypoint can chown PGDATA + step down via su-exec.
  config = nonRoot.rootConfig // {
    Env = base.defaultEnv ++ nonRoot.rootEnv ++ [
      "PGDATA=/var/lib/postgresql/data"
    ];
    Entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
    Cmd = [ "postgres" ];
    ExposedPorts = {
      "5432/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "postgres-fips";
      "org.opencontainers.image.description" = "PostgreSQL database server (FIPS-intent build) with docker-library-compatible entrypoint";
      "org.opencontainers.image.version" = pkgs.postgresql.version;
      "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
