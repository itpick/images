{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# harbor-jobservice-fips
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
  name = "harbor-jobservice-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "harbor-jobservice-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "harbor-jobservice-fips";
      "org.opencontainers.image.description" = "harbor-jobservice-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
