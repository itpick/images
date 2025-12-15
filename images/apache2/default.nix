{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# apache2
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
  name = "apache2";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "apache2-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "apache2";
      "org.opencontainers.image.description" = "apache2 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
