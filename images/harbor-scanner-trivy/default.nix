{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# harbor-scanner-trivy
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
  name = "harbor-scanner-trivy";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "harbor-scanner-trivy-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "haruor scanner trivy";
      "org.opencontainers.image.description" = "harbor-scanner-trivy container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
