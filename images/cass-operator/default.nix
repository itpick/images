{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cass-operator
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
  name = "cass-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cass-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cass operator";
      "org.opencontainers.image.description" = "cass-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
