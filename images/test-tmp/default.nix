{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# test-tmp
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
  name = "test-tmp";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "test-tmp-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "test-tmp";
      "org.opencontainers.image.description" = "test-tmp container image";
    };
  };
}
