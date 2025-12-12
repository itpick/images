{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jenkins-utils
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
  name = "jenkins-utils";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "jenkins-utils-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jenkins utils";
      "org.opencontainers.image.description" = "jenkins-utils container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
