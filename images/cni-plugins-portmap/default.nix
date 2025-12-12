{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cni-plugins-portmap
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
  name = "cni-plugins-portmap";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cni-plugins-portmap-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cni plugins portmap";
      "org.opencontainers.image.description" = "cni-plugins-portmap container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
