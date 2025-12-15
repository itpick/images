{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# argo-cd-fips-3.2-repo-server
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
  name = "argo-cd-fips-3.2-repo-server";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "argo-cd-fips-3.2-repo-server-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "argo cd fips 3.2 repo server";
      "org.opencontainers.image.description" = "argo-cd-fips-3.2-repo-server container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
