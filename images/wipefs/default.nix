{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# wipefs
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
  name = "wipefs";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "wipefs-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "wipefs";
      "org.opencontainers.image.description" = "wipefs container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
