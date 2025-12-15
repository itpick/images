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
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "ca certificates";
      "org.opencontainers.image.description" = "ca-certificates container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
