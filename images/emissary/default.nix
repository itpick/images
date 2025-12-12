{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# emissary
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
  name = "emissary";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "emissary-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "emissary";
      "org.opencontainers.image.description" = "emissary container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
