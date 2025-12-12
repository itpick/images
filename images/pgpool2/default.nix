{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pgpool2
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
  name = "pgpool2";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pgpool2-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pgpool2";
      "org.opencontainers.image.description" = "pgpool2 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
