{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openssf-compiler-options
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
  name = "openssf-compiler-options";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openssf-compiler-options-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "openssf compiler options";
      "org.opencontainers.image.description" = "openssf-compiler-options container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
