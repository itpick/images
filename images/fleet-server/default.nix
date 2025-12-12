{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fleet-server
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
  name = "fleet-server";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "fleet-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "fleet server";
      "org.opencontainers.image.description" = "fleet-server container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
