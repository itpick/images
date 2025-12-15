{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# quic-network-simulator
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
  name = "quic-network-simulator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "quic-network-simulator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "quic network simulator";
      "org.opencontainers.image.description" = "quic-network-simulator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
