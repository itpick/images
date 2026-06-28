{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# MySQL database server
# Using MariaDB as a MySQL-compatible drop-in replacement

let
  mysqlPackages = with pkgs; [
    mariadb
    bash
    coreutils
    tzdata
    findutils
    which
    gnused
    gosu  # drop root -> mysql uid (mariadbd should not run as root)
  ];

  # docker-library-compatible entrypoint: mariadb-install-db on first boot,
  # then exec the server. Identical to the sibling images/mariadb entrypoint
  # (this image is MariaDB as a MySQL-compatible drop-in).
  entrypoint = pkgs.writeShellApplication {
    name = "docker-entrypoint.sh";
    runtimeInputs = mysqlPackages;
    text = builtins.readFile ./docker-entrypoint.sh;
  };

  # The uid:gid the server actually runs as.
  mysqlUser = { uid = 999; gid = 999; name = "mysql"; home = "/var/lib/mysql"; };
  userEnv = nonRoot.mkCustomUserEnv pkgs mysqlUser [];

  # Pre-create the writable runtime dirs (data + Unix socket dir), owned by the
  # mysql uid so the server can write even when started from a fresh volume.
  mysqlDirs = pkgs.runCommand "mysql-dirs" {} ''
    mkdir -p $out/var/lib/mysql
    mkdir -p $out/run/mysqld
    chmod 700 $out/var/lib/mysql
    chmod 775 $out/run/mysqld
  '';

in
nix2container.buildImage {
  name = "mysql";
  # Version-tag the image (matches the org.opencontainers.image.version label).
  tag = pkgs.mariadb.version;

  copyToRoot = [
    (buildEnv {
      name = "mysql-root";
      paths = base.basePackages ++ mysqlPackages ++ [ entrypoint userEnv mysqlDirs ];
    })
  ];

  perms = [
    {
      path = mysqlDirs;
      regex = "/var/lib/mysql";
      mode = "0700";
      uid = mysqlUser.uid;
      gid = mysqlUser.gid;
    }
    {
      path = mysqlDirs;
      regex = "/run/mysqld";
      mode = "0775";
      uid = mysqlUser.uid;
      gid = mysqlUser.gid;
    }
  ];

  # Chainguard runs mysql/mariadb as root; the entrypoint drops to the mysql
  # uid (via gosu) before mariadb-install-db / mariadbd.
  config = nonRoot.rootConfig // {
    Entrypoint = [ "${entrypoint}/bin/docker-entrypoint.sh" ];
    Cmd = [ "mariadbd" ];
    Env = base.defaultEnv ++ nonRoot.rootEnv ++ [
      "PATH=${lib.makeBinPath mysqlPackages}"
      "MARIADB_DATA_DIR=/var/lib/mysql"
    ];
    ExposedPorts = {
      "3306/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "MySQL-compatible database server (MariaDB)";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.mariadb.version;
      "io.nix-containers.image.upstream" = "https://mariadb.org/";
      "io.nix-containers.image.category" = "database";
      "io.nix-containers.image.aliases" = "mysql,mariadb,database,sql";
    };
  };
}
