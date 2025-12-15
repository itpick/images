{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openblas-static
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
  name = "openblas-static";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openblas-static-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "openulas static";
      "org.opencontainers.image.description" = "openblas-static container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
