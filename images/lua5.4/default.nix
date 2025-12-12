{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# lua5.4
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
  name = "lua5.4";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "lua5.4-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "lua5.4";
      "org.opencontainers.image.description" = "lua5.4 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
