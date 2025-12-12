{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# thanos-operator
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
  name = "thanos-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "thanos-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "thanos operator";
      "org.opencontainers.image.description" = "thanos-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
