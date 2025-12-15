{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# apache-tika
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
  name = "apache-tika";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "apache-tika-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "apache tika";
      "org.opencontainers.image.description" = "apache-tika container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
