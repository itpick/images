{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# neuvector-updater-fips
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
  name = "neuvector-updater-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "neuvector-updater-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "neuvector-updater-fips";
      "org.opencontainers.image.description" = "neuvector-updater-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
