{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# go-openssl
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
  name = "go-openssl";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "go-openssl-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "go openssl";
      "org.opencontainers.image.description" = "go-openssl container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
