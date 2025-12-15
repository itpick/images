{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cloud-provider-aws
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
  name = "cloud-provider-aws";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "cloud-provider-aws-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "cloud-provider-aws";
      "org.opencontainers.image.description" = "cloud-provider-aws container image";
    };
  };
}
