{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sealed-secrets-controller
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
  name = "sealed-secrets-controller";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "sealed-secrets-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "sealed-secrets-controller";
      "org.opencontainers.image.description" = "sealed-secrets-controller container image";
    };
  };
}
