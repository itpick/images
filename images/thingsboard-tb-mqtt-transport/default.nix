{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# thingsboard-tb-mqtt-transport
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
  name = "thingsboard-tb-mqtt-transport";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "thingsboard-tb-mqtt-transport-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "thingsuoard tu mqtt transport";
      "org.opencontainers.image.description" = "thingsboard-tb-mqtt-transport container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
