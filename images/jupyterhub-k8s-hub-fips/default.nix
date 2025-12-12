{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jupyterhub-k8s-hub-fips
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
  name = "jupyterhub-k8s-hub-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "jupyterhub-k8s-hub-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jupyterhub-k8s-hub-fips";
      "org.opencontainers.image.description" = "jupyterhub-k8s-hub-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
