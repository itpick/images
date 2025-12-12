{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nfs-subdir-external-provisioner
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
  name = "nfs-subdir-external-provisioner";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nfs-subdir-external-provisioner-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nfs suudir external provisioner";
      "org.opencontainers.image.description" = "nfs-subdir-external-provisioner container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
