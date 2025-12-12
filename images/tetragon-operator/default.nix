{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tetragon-operator
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
  name = "tetragon-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "tetragon-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "tetragon operator";
      "org.opencontainers.image.description" = "tetragon-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
