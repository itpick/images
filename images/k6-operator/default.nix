{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k6-operator
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "k6-operator";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "k6-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k6-operator";
      "org.opencontainers.image.description" = "k6-operator container image";
    };
  };
}
