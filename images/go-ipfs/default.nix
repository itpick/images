{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# go-ipfs
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "go-ipfs";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "go-ipfs-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "go-ipfs";
      "org.opencontainers.image.description" = "go-ipfs container image";
    };
  };
}
