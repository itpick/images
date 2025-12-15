{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# wait-for-it-fips
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
  name = "wait-for-it-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "wait-for-it-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "wait-for-it-fips";
      "org.opencontainers.image.description" = "wait-for-it-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
