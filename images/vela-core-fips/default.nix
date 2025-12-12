{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vela-core-fips
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
  name = "vela-core-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "vela-core-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vela-core-fips";
      "org.opencontainers.image.description" = "vela-core-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
