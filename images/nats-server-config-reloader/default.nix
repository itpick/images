{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# nats-server-config-reloader
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
  name = "nats-server-config-reloader";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "nats-server-config-reloader-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "nats server config reloader";
      "org.opencontainers.image.description" = "nats-server-config-reloader container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
