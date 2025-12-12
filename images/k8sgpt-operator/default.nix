{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8sgpt-operator
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
  name = "k8sgpt-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "k8sgpt-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k8sgpt operator";
      "org.opencontainers.image.description" = "k8sgpt-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
