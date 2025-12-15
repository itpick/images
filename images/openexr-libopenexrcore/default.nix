{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openexr-libopenexrcore
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
  name = "openexr-libopenexrcore";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openexr-libopenexrcore-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "openexr liuopenexrcore";
      "org.opencontainers.image.description" = "openexr-libopenexrcore container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
