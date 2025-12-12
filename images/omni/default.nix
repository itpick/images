{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# omni
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
  name = "omni";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "omni-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "omni";
      "org.opencontainers.image.description" = "omni container image";
    };
  };
}
