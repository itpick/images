{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# systemd-systemctl
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
  name = "systemd-systemctl";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "systemd-systemctl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "systemd systemctl";
      "org.opencontainers.image.description" = "systemd-systemctl container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
