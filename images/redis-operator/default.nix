{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# redis-operator
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
  name = "redis-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "redis-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "redis operator";
      "org.opencontainers.image.description" = "redis-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
