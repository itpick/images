{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dependency-track-bundled
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
  name = "dependency-track-bundled";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dependency-track-bundled-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dependency track uundled";
      "org.opencontainers.image.description" = "dependency-track-bundled container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
