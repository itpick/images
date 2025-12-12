{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pvc-autoresizer
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
  name = "pvc-autoresizer";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pvc-autoresizer-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pvc autoresizer";
      "org.opencontainers.image.description" = "pvc-autoresizer container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
