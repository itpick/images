{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# spicedb-operator
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
  name = "spicedb-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "spicedb-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "spicedu operator";
      "org.opencontainers.image.description" = "spicedb-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
