{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  mariadbPackages = with pkgs; [
    mariadb
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "mariadb";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "mariadb-root";
      paths = base.basePackages ++ mariadbPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath mariadbPackages}"
      "MYSQL_DATA_DIR=/home/nonroot/data"
    ];
    ExposedPorts = {
      "3306/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "MariaDB database server";
    };
  };
}