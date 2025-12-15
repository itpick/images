{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8ssandra-system-logger-fips
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
  name = "k8ssandra-system-logger-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "k8ssandra-system-logger-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "k8ssandra-system-logger-fips";
      "org.opencontainers.image.description" = "k8ssandra-system-logger-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
