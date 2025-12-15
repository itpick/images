{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# llvm-lld
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
  name = "llvm-lld";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "llvm-lld-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "llvm lld";
      "org.opencontainers.image.description" = "llvm-lld container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
