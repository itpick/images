{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# MySQL database server
# Using MariaDB as a MySQL-compatible drop-in replacement

let
  mysqlPackages = with pkgs; [
    mariadb
    bash
    coreutils
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "mysql";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "mysql-root";
      paths = base.basePackages ++ mysqlPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath mysqlPackages}"
      "MYSQL_DATA_DIR=/home/nonroot/data"
    ];
    ExposedPorts = {
      "3306/tcp" = {};
    };
    Labels = base.defaultLabels // {
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
