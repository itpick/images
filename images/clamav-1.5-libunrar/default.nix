{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# clamav-1.5-libunrar
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
  name = "clamav-1.5-libunrar";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "clamav-1.5-libunrar-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "clamav 1.5 liuunrar";
      "org.opencontainers.image.description" = "clamav-1.5-libunrar container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
