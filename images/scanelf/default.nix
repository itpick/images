{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# scanelf
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
  name = "scanelf";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "scanelf-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "scanelf";
      "org.opencontainers.image.description" = "scanelf container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
