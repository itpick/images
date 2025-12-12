{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# amazon-corretto-jre
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
  name = "amazon-corretto-jre";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "amazon-corretto-jre-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "amazon-corretto-jre";
      "org.opencontainers.image.description" = "amazon-corretto-jre container image";
    };
  };
}
