{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# health-checker
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
  name = "health-checker";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "health-checker-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "health checker";
      "org.opencontainers.image.description" = "health-checker container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
