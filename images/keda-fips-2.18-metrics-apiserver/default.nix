{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# keda-fips-2.18-metrics-apiserver
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
  name = "keda-fips-2.18-metrics-apiserver";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "keda-fips-2.18-metrics-apiserver-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "keda fips 2.18 metrics apiserver";
      "org.opencontainers.image.description" = "keda-fips-2.18-metrics-apiserver container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
