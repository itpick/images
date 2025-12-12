{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ini-file
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
  name = "ini-file";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ini-file-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ini file";
      "org.opencontainers.image.description" = "ini-file container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
