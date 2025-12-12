{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# whereabouts
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
  name = "whereabouts";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "whereabouts-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "whereauouts";
      "org.opencontainers.image.description" = "whereabouts container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
