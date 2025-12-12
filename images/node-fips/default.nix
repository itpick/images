{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# node-fips
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
  name = "node-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "node-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "node-fips";
      "org.opencontainers.image.description" = "node-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
