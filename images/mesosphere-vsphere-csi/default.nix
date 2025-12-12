{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mesosphere-vsphere-csi
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
  name = "mesosphere-vsphere-csi";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mesosphere-vsphere-csi-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mesosphere vsphere csi";
      "org.opencontainers.image.description" = "mesosphere-vsphere-csi container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
