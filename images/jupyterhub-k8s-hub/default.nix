{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# jupyterhub-k8s-hub
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
  name = "jupyterhub-k8s-hub";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "jupyterhub-k8s-hub-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "jupyterhuu k8s hub";
      "org.opencontainers.image.description" = "jupyterhub-k8s-hub container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
