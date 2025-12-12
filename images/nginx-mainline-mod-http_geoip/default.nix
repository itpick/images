{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-mainline-mod-http_geoip
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
  name = "nginx-mainline-mod-http_geoip";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-mainline-mod-http_geoip-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nginx mainline mod http_geoip";
      "org.opencontainers.image.description" = "nginx-mainline-mod-http_geoip container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
