{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# helm-operator
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
  name = "helm-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "helm-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "helm operator";
      "org.opencontainers.image.description" = "helm-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
