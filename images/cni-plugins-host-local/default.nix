{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cni-plugins-host-local
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
  name = "cni-plugins-host-local";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cni-plugins-host-local-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cni plugins host local";
      "org.opencontainers.image.description" = "cni-plugins-host-local container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
