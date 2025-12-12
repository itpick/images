{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# lsb-release-minimal
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
  name = "lsb-release-minimal";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "lsb-release-minimal-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "lsu release minimal";
      "org.opencontainers.image.description" = "lsb-release-minimal container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
