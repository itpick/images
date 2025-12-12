{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dex-fips
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
  name = "dex-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "dex-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dex-fips";
      "org.opencontainers.image.description" = "dex-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
