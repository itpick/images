{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# njs
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
  name = "njs";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "njs-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "njs";
      "org.opencontainers.image.description" = "njs container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
