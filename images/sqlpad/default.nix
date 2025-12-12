{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sqlpad
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
  name = "sqlpad";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "sqlpad-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "sqlpad";
      "org.opencontainers.image.description" = "sqlpad container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
