{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# akhq-fips
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
  name = "akhq-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "akhq-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "akhq-fips";
      "org.opencontainers.image.description" = "akhq-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
