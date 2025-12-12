{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# gke-gcloud-auth-plugin
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
  name = "gke-gcloud-auth-plugin";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "gke-gcloud-auth-plugin-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "gke gcloud auth plugin";
      "org.opencontainers.image.description" = "gke-gcloud-auth-plugin container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
