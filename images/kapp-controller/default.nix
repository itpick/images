{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kapp-controller
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
  name = "kapp-controller";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "kapp-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kapp controller";
      "org.opencontainers.image.description" = "kapp-controller container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
