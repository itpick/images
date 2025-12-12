{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# argocd-fips
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
  name = "argocd-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "argocd-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "argocd-fips";
      "org.opencontainers.image.description" = "argocd-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
