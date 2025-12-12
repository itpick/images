{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k3s-multicall
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
  name = "k3s-multicall";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "k3s-multicall-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k3s multicall";
      "org.opencontainers.image.description" = "k3s-multicall container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
