{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tesseract-osd
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
  name = "tesseract-osd";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tesseract-osd-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tesseract osd";
      "org.opencontainers.image.description" = "tesseract-osd container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
