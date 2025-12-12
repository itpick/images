{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nrjmx
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
  name = "nrjmx";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nrjmx-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nrjmx";
      "org.opencontainers.image.description" = "nrjmx container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
