{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mig-parted
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
  name = "mig-parted";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mig-parted-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mig parted";
      "org.opencontainers.image.description" = "mig-parted container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
