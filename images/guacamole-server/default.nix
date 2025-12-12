{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# guacamole-server
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "guacamole-server";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "guacamole-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "guacamole-server";
      "org.opencontainers.image.description" = "guacamole-server container image";
    };
  };
}
