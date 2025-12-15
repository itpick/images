{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# emissary-apiext
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
  name = "emissary-apiext";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "emissary-apiext-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "emissary apiext";
      "org.opencontainers.image.description" = "emissary-apiext container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
