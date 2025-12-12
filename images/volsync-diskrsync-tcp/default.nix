{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# volsync-diskrsync-tcp
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
  name = "volsync-diskrsync-tcp";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "volsync-diskrsync-tcp-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "volsync diskrsync tcp";
      "org.opencontainers.image.description" = "volsync-diskrsync-tcp container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
