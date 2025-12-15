{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openexr-libopenexr
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
  name = "openexr-libopenexr";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openexr-libopenexr-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "openexr liuopenexr";
      "org.opencontainers.image.description" = "openexr-libopenexr container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
