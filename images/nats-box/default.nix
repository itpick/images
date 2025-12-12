{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nats-box
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
  name = "nats-box";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nats-box-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nats uox";
      "org.opencontainers.image.description" = "nats-box container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
