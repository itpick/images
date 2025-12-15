{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# sealed-secrets-kubeseal
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
  name = "sealed-secrets-kubeseal";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "sealed-secrets-kubeseal-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "sealed secrets kuueseal";
      "org.opencontainers.image.description" = "sealed-secrets-kubeseal container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
