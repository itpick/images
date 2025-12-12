{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dockerize
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
  name = "dockerize";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dockerize-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dockerize";
      "org.opencontainers.image.description" = "dockerize container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
