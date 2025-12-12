{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gpu-operator
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
  name = "gpu-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gpu-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gpu operator";
      "org.opencontainers.image.description" = "gpu-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
