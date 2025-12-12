{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# amazon-corretto-jdk-fips
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
  name = "amazon-corretto-jdk-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "amazon-corretto-jdk-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "amazon-corretto-jdk-fips";
      "org.opencontainers.image.description" = "amazon-corretto-jdk-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
