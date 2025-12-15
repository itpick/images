{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fuse-overlayfs-snapshotter
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
  name = "fuse-overlayfs-snapshotter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "fuse-overlayfs-snapshotter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "fuse overlayfs snapshotter";
      "org.opencontainers.image.description" = "fuse-overlayfs-snapshotter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
