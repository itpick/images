{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# go-discover
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
  name = "go-discover";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "go-discover-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "go discover";
      "org.opencontainers.image.description" = "go-discover container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
