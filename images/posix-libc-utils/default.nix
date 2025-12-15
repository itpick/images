{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# posix-libc-utils
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
  name = "posix-libc-utils";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "posix-libc-utils-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "posix liuc utils";
      "org.opencontainers.image.description" = "posix-libc-utils container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
