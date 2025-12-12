{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# wildfly
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
  name = "wildfly";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "wildfly-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "wildfly";
      "org.opencontainers.image.description" = "wildfly container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
