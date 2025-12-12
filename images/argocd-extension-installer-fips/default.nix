{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# argocd-extension-installer-fips
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
  name = "argocd-extension-installer-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "argocd-extension-installer-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "argocd-extension-installer-fips";
      "org.opencontainers.image.description" = "argocd-extension-installer-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
