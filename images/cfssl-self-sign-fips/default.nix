{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cfssl-self-sign-fips
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
  name = "cfssl-self-sign-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cfssl-self-sign-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "cfssl-self-sign-fips";
      "org.opencontainers.image.description" = "cfssl-self-sign-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
