{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# geoip-api
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
  name = "geoip-api";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "geoip-api-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "geoip api";
      "org.opencontainers.image.description" = "geoip-api container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
