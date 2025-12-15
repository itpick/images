{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# systemd-boot
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
  name = "systemd-boot";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "systemd-boot-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "systemd uoot";
      "org.opencontainers.image.description" = "systemd-boot container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
