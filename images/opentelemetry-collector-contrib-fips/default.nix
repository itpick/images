{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# opentelemetry-collector-contrib-fips
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
  name = "opentelemetry-collector-contrib-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "opentelemetry-collector-contrib-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "opentelemetry collector contriu fips";
      "org.opencontainers.image.description" = "opentelemetry-collector-contrib-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
