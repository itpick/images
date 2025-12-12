{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# missing-images.txt
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
  name = "missing-images.txt";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "missing-images.txt-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "missing-images.txt";
      "org.opencontainers.image.description" = "missing-images.txt container image";
    };
  };
}
