{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# promitor
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
  name = "promitor";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "promitor-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "promitor";
      "org.opencontainers.image.description" = "promitor container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
