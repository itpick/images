{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# mosquitto-libs++
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
  name = "mosquitto-libs++";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "mosquitto-libs++-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "mosquitto lius++";
      "org.opencontainers.image.description" = "mosquitto-libs++ container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
