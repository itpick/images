{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sox-ng
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
  name = "sox-ng";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "sox-ng-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "sox ng";
      "org.opencontainers.image.description" = "sox-ng container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
