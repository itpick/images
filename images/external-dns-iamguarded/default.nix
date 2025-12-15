{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# external-dns-iamguarded
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
  name = "external-dns-iamguarded";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "external-dns-iamguarded-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "external-dns-iamguarded";
      "org.opencontainers.image.description" = "external-dns-iamguarded container image";
    };
  };
}
