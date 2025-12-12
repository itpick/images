{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cloud-provider-vsphere
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
  name = "cloud-provider-vsphere";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cloud-provider-vsphere-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cloud provider vsphere";
      "org.opencontainers.image.description" = "cloud-provider-vsphere container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
