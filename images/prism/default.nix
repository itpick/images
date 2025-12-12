{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# prism
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
  name = "prism";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "prism-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "prism";
      "org.opencontainers.image.description" = "prism container image";
    };
  };
}
