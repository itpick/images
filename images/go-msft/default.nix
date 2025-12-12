{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# go-msft
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
  name = "go-msft";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "go-msft-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "go msft";
      "org.opencontainers.image.description" = "go-msft container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
