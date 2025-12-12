{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8ssandra-operator
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
  name = "k8ssandra-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "k8ssandra-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k8ssandra operator";
      "org.opencontainers.image.description" = "k8ssandra-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
