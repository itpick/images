{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# selenium-server
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
  name = "selenium-server";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "selenium-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "selenium server";
      "org.opencontainers.image.description" = "selenium-server container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
