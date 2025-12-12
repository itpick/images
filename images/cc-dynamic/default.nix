{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cc-dynamic
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
  name = "cc-dynamic";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cc-dynamic-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "cc-dynamic";
      "org.opencontainers.image.description" = "cc-dynamic container image";
    };
  };
}
