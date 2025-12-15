{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tesseract-eng
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
  name = "tesseract-eng";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tesseract-eng-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "tesseract eng";
      "org.opencontainers.image.description" = "tesseract-eng container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
