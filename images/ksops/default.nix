{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ksops
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
  name = "ksops";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ksops-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ksops";
      "org.opencontainers.image.description" = "ksops container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
