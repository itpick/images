{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# smarter-device-manager
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
  name = "smarter-device-manager";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "smarter-device-manager-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "smarter-device-manager";
      "org.opencontainers.image.description" = "smarter-device-manager container image";
    };
  };
}
