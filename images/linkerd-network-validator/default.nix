{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# linkerd-network-validator
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
  name = "linkerd-network-validator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "linkerd-network-validator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "linkerd network validator";
      "org.opencontainers.image.description" = "linkerd-network-validator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
