{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# argocd-repo-server-fips
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
  name = "argocd-repo-server-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "argocd-repo-server-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "argocd-repo-server-fips";
      "org.opencontainers.image.description" = "argocd-repo-server-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
