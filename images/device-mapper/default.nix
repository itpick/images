{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# device-mapper
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
  name = "device-mapper";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "device-mapper-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "device mapper";
      "org.opencontainers.image.description" = "device-mapper container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
