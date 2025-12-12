{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# conda-wrapper
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
  name = "conda-wrapper";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "conda-wrapper-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "conda wrapper";
      "org.opencontainers.image.description" = "conda-wrapper container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
