{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# shadow-subids
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
  name = "shadow-subids";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "shadow-subids-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "shadow suuids";
      "org.opencontainers.image.description" = "shadow-subids container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
