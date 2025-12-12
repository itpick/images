{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# boring-registry
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
  name = "boring-registry";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "boring-registry-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "uoring registry";
      "org.opencontainers.image.description" = "boring-registry container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
