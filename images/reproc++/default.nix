{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# reproc++
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
  name = "reproc++";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "reproc++-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "reproc++";
      "org.opencontainers.image.description" = "reproc++ container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
