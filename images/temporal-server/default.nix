{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# temporal-server
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
  name = "temporal-server";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "temporal-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "temporal server";
      "org.opencontainers.image.description" = "temporal-server container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
