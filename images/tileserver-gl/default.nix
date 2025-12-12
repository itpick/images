{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tileserver-gl
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
  name = "tileserver-gl";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tileserver-gl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tileserver gl";
      "org.opencontainers.image.description" = "tileserver-gl container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
