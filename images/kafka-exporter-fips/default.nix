{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kafka-exporter-fips
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "kafka-exporter-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kafka-exporter-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kafka-exporter-fips";
      "org.opencontainers.image.description" = "kafka-exporter-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
