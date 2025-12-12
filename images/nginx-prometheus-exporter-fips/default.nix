{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nginx-prometheus-exporter-fips
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
  name = "nginx-prometheus-exporter-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nginx-prometheus-exporter-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nginx prometheus exporter fips";
      "org.opencontainers.image.description" = "nginx-prometheus-exporter-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
