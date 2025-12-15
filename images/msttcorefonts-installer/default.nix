{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# msttcorefonts-installer
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
  name = "msttcorefonts-installer";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "msttcorefonts-installer-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "msttcorefonts installer";
      "org.opencontainers.image.description" = "msttcorefonts-installer container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
