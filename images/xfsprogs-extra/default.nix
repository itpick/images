{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# xfsprogs-extra
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
  name = "xfsprogs-extra";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "xfsprogs-extra-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "xfsprogs extra";
      "org.opencontainers.image.description" = "xfsprogs-extra container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
