{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bats-fips
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
  name = "bats-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "bats-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "bats-fips";
      "org.opencontainers.image.description" = "bats-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
