{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# infinispan
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
  name = "infinispan";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "infinispan-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "infinispan";
      "org.opencontainers.image.description" = "infinispan container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
