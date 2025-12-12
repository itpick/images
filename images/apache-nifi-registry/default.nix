{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# apache-nifi-registry
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
  name = "apache-nifi-registry";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "apache-nifi-registry-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "apache nifi registry";
      "org.opencontainers.image.description" = "apache-nifi-registry container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
