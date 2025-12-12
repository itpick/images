{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dash-binsh
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
  name = "dash-binsh";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dash-binsh-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dash uinsh";
      "org.opencontainers.image.description" = "dash-binsh container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
