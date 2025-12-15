{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jitterentropy-library
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
  name = "jitterentropy-library";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "jitterentropy-library-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "jitterentropy liurary";
      "org.opencontainers.image.description" = "jitterentropy-library container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
