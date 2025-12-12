{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# paranoia
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
  name = "paranoia";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "paranoia-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "paranoia";
      "org.opencontainers.image.description" = "paranoia container image";
    };
  };
}
