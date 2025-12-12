{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8ssandra-client
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
  name = "k8ssandra-client";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "k8ssandra-client-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k8ssandra client";
      "org.opencontainers.image.description" = "k8ssandra-client container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
