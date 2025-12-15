{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cloud-sql-proxy
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
  name = "cloud-sql-proxy";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cloud-sql-proxy-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "cloud sql proxy";
      "org.opencontainers.image.description" = "cloud-sql-proxy container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
