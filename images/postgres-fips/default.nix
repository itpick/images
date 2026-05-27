{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# postgres-fips
# Container image

let
  imagePkgs = with pkgs; [
    postgresql
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "postgres-fips";
  tag = pkgs.postgresql.version;
  copyToRoot = [
    (buildEnv {
      name = "postgres-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    ExposedPorts = {
      "5432/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "postgres-fips";
      "org.opencontainers.image.description" = "PostgreSQL database server (FIPS-intent build)";
      "org.opencontainers.image.version" = pkgs.postgresql.version;
      "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
