{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# argo-workflows-known-hosts-fips
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
  name = "argo-workflows-known-hosts-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "argo-workflows-known-hosts-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "argo workflows known hosts fips";
      "org.opencontainers.image.description" = "argo-workflows-known-hosts-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
