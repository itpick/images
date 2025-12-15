{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cni-plugins-bandwidth
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
  name = "cni-plugins-bandwidth";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cni-plugins-bandwidth-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "cni plugins uandwidth";
      "org.opencontainers.image.description" = "cni-plugins-bandwidth container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
