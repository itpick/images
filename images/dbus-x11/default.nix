{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# dbus-x11
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
  name = "dbus-x11";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "dbus-x11-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "duus x11";
      "org.opencontainers.image.description" = "dbus-x11 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
