{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dogstatsd
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
  name = "dogstatsd";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dogstatsd-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "dogstatsd";
      "org.opencontainers.image.description" = "dogstatsd container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
