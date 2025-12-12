{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# argo-cd-3.2-repo-server
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
  name = "argo-cd-3.2-repo-server";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "argo-cd-3.2-repo-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "argo cd 3.2 repo server";
      "org.opencontainers.image.description" = "argo-cd-3.2-repo-server container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
