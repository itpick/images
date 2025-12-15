{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mesosphere-vsphere-csi-syncer
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
  name = "mesosphere-vsphere-csi-syncer";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mesosphere-vsphere-csi-syncer-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "mesosphere vsphere csi syncer";
      "org.opencontainers.image.description" = "mesosphere-vsphere-csi-syncer container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
