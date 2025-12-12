{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rpm2cpio
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
  name = "rpm2cpio";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "rpm2cpio-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "rpm2cpio";
      "org.opencontainers.image.description" = "rpm2cpio container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
