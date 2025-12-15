{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# busybox-full
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
  name = "busybox-full";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "busybox-full-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "uusyuox full";
      "org.opencontainers.image.description" = "busybox-full container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
