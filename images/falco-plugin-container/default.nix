{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# falco-plugin-container
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
  name = "falco-plugin-container";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "falco-plugin-container-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "falco plugin container";
      "org.opencontainers.image.description" = "falco-plugin-container container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
