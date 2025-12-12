{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# bpftool
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
  name = "bpftool";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "bpftool-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "upftool";
      "org.opencontainers.image.description" = "bpftool container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
