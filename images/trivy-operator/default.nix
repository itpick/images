{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# trivy-operator
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
  name = "trivy-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "trivy-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "trivy operator";
      "org.opencontainers.image.description" = "trivy-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
