{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gitness
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
  name = "gitness";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gitness-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gitness";
      "org.opencontainers.image.description" = "gitness container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
