{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cassandra-medusa-fips
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "cassandra-medusa-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cassandra-medusa-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cassandra-medusa-fips";
      "org.opencontainers.image.description" = "cassandra-medusa-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
