{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# apache-nifi-registry-toolkit
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
  name = "apache-nifi-registry-toolkit";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "apache-nifi-registry-toolkit-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "apache nifi registry toolkit";
      "org.opencontainers.image.description" = "apache-nifi-registry-toolkit container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
