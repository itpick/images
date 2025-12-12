{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gmock
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
  name = "gmock";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gmock-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gmock";
      "org.opencontainers.image.description" = "gmock container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
