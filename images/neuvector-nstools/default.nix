{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# neuvector-nstools
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
  name = "neuvector-nstools";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "neuvector-nstools-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "neuvector nstools";
      "org.opencontainers.image.description" = "neuvector-nstools container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
