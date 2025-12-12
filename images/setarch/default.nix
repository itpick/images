{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# setarch
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
  name = "setarch";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "setarch-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "setarch";
      "org.opencontainers.image.description" = "setarch container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
