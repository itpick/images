{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kustomize-mutating-webhook-fips
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
  name = "kustomize-mutating-webhook-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kustomize-mutating-webhook-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "kustomize-mutating-webhook-fips";
      "org.opencontainers.image.description" = "kustomize-mutating-webhook-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
