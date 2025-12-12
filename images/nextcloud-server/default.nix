{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nextcloud-server
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
  name = "nextcloud-server";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nextcloud-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nextcloud server";
      "org.opencontainers.image.description" = "nextcloud-server container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
