{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# metallb-cp-tool
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "metallb-cp-tool";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "metallb-cp-tool-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "metallu cp tool";
      "org.opencontainers.image.description" = "metallb-cp-tool container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
