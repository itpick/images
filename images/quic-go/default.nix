{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# quic-go
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
  name = "quic-go";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "quic-go-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "quic go";
      "org.opencontainers.image.description" = "quic-go container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
