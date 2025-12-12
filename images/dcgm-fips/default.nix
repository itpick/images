{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dcgm-fips
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
  name = "dcgm-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "dcgm-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dcgm-fips";
      "org.opencontainers.image.description" = "dcgm-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
