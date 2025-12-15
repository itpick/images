{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sriov-network-device-plugin
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
  name = "sriov-network-device-plugin";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "sriov-network-device-plugin-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "sriov network device plugin";
      "org.opencontainers.image.description" = "sriov-network-device-plugin container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
