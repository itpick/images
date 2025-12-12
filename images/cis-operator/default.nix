{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cis-operator
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
  name = "cis-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cis-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cis operator";
      "org.opencontainers.image.description" = "cis-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
