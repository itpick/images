{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pg-failover-slots
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
  name = "pg-failover-slots";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pg-failover-slots-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "pg failover slots";
      "org.opencontainers.image.description" = "pg-failover-slots container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
