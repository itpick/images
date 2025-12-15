{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cerbos
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
  name = "cerbos";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cerbos-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "ceruos";
      "org.opencontainers.image.description" = "cerbos container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
