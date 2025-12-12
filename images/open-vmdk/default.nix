{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# open-vmdk
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
  name = "open-vmdk";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "open-vmdk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "open vmdk";
      "org.opencontainers.image.description" = "open-vmdk container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
