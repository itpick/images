{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# frr-fips
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
  name = "frr-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "frr-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "frr-fips";
      "org.opencontainers.image.description" = "frr-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
