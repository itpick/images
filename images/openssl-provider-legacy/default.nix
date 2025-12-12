{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openssl-provider-legacy
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
  name = "openssl-provider-legacy";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "openssl-provider-legacy-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openssl provider legacy";
      "org.opencontainers.image.description" = "openssl-provider-legacy container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
