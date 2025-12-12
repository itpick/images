{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jre-crac
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
  name = "jre-crac";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "jre-crac-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jre-crac";
      "org.opencontainers.image.description" = "jre-crac container image";
    };
  };
}
