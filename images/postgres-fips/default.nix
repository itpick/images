{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postgres-fips
# Turnkey postgres container: docker-library-compatible entrypoint that
# runs initdb on first start, honors POSTGRES_DB/USER/PASSWORD env vars,
# and processes /docker-entrypoint-initdb.d/*.{sh,sql,sql.gz}.
#
# Runs as uid:gid 999:999 by default (the postgres user we bake into
# /etc/passwd). PGDATA and the Unix-socket dir are pre-created in the
# image with that ownership so the image works under hardened compose
# stacks that drop CAP_CHOWN (cap_drop: ALL). When docker mounts a fresh
# anonymous volume at PGDATA, it inherits the image-side ownership of
# that mount point.

let
  imagePkgs = with pkgs; [
    postgresql
    bash
    coreutils
    gzip
    cacert
    tzdata
  ];

  postgresUser = {
    uid = 999;
    gid = 999;
    name = "postgres";
    home = "/home/postgres";
  };
  userEnv = nonRoot.mkCustomUserEnv pkgs postgresUser [];

  # Pre-create writable runtime dirs. perms below assigns 999:999 ownership.
  pgDirs = pkgs.runCommand "postgres-fips-dirs" {} ''
    mkdir -p $out/var/lib/postgresql/data
    mkdir -p $out/var/run/postgresql
    chmod 700 $out/var/lib/postgresql/data
    chmod 775 $out/var/run/postgresql
  '';

  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = imagePkgs;
    text = builtins.readFile ./docker-entrypoint.sh;
    excludeShellChecks = [ "SC2086" "SC1090" ];
  };

in nix2container.buildImage {
  name = "postgres-fips";
  tag = pkgs.postgresql.version;

  layers = [
    (nix2container.buildLayer {
      copyToRoot = [
        (buildEnv {
          name = "postgres-fips-root";
          paths = base.basePackages ++ imagePkgs ++ [ entrypoint userEnv pgDirs ];
        })
      ];
      perms = [
        {
          path = pgDirs;
          regex = "/var/lib/postgresql/data";
          mode = "0700";
          uid = postgresUser.uid;
          gid = postgresUser.gid;
        }
        {
          path = pgDirs;
          regex = "/var/run/postgresql";
          mode = "0775";
          uid = postgresUser.uid;
          gid = postgresUser.gid;
        }
      ];
    })
  ];

  config = {
    User = "${toString postgresUser.uid}:${toString postgresUser.gid}";
    WorkingDir = postgresUser.home;
    Env = base.defaultEnv ++ [
      "HOME=${postgresUser.home}"
      "USER=${postgresUser.name}"
      "PGDATA=/var/lib/postgresql/data"
      # postgres' compile-time default Unix-socket dir is /run/postgresql, but
      # this image only ships /var/run/postgresql. Setting PGHOST here makes
      # libpq tools (pg_isready, psql) find the socket by default — which is
      # what compose healthchecks like `pg_isready -U pda` rely on.
      "PGHOST=/var/run/postgresql"
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
      "org.opencontainers.image.description" = "PostgreSQL database server (FIPS-intent build) with docker-library-compatible entrypoint, runs as uid 999";
      "org.opencontainers.image.version" = pkgs.postgresql.version;
      "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
