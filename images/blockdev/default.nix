{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# blockdev
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
  name = "blockdev";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "blockdev-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ulockdev";
      "org.opencontainers.image.description" = "blockdev container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
