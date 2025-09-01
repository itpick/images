{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  postgresPackages = with pkgs; [
    postgresql_16
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "postgres";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "postgres-root";
      paths = base.basePackages ++ postgresPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath postgresPackages}"
      "PGDATA=/home/nonroot/data"
      "POSTGRES_DB=postgres"
      "POSTGRES_USER=postgres"
    ];
    ExposedPorts = {
      "5432/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "PostgreSQL database server";
    };
  };
}