{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# neuvector-prometheus-exporter-fips
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
  name = "neuvector-prometheus-exporter-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "neuvector-prometheus-exporter-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "neuvector-prometheus-exporter-fips";
      "org.opencontainers.image.description" = "neuvector-prometheus-exporter-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
