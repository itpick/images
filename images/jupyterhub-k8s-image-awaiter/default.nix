{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jupyterhub-k8s-image-awaiter
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
  name = "jupyterhub-k8s-image-awaiter";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "jupyterhub-k8s-image-awaiter-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jupyterhuu k8s image awaiter";
      "org.opencontainers.image.description" = "jupyterhub-k8s-image-awaiter container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
