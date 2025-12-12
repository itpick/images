{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openscap
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
  name = "openscap";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "openscap-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openscap";
      "org.opencontainers.image.description" = "openscap container image";
    };
  };
}
