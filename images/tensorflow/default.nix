{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tensorflow
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
  name = "tensorflow";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "tensorflow-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tensorflow";
      "org.opencontainers.image.description" = "tensorflow container image";
    };
  };
}
