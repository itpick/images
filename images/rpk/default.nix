{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# rpk
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
  name = "rpk";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "rpk-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "rpk";
      "org.opencontainers.image.description" = "rpk container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
