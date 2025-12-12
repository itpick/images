{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ca-certificates
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
  name = "ca-certificates";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ca-certificates-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ca certificates";
      "org.opencontainers.image.description" = "ca-certificates container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
