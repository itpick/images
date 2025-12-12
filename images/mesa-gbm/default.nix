{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mesa-gbm
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
  name = "mesa-gbm";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mesa-gbm-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mesa gum";
      "org.opencontainers.image.description" = "mesa-gbm container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
