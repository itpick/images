{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# fluxcd-kustomize-mutating-webhook-fips
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
  name = "fluxcd-kustomize-mutating-webhook-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "fluxcd-kustomize-mutating-webhook-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "fluxcd kustomize mutating weuhook fips";
      "org.opencontainers.image.description" = "fluxcd-kustomize-mutating-webhook-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
