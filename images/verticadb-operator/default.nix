{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# verticadb-operator
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
  name = "verticadb-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "verticadb-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "verticadu operator";
      "org.opencontainers.image.description" = "verticadb-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
