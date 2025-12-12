{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# volume-modifier-for-k8s-fips
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
  name = "volume-modifier-for-k8s-fips";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "volume-modifier-for-k8s-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "volume modifier for k8s fips";
      "org.opencontainers.image.description" = "volume-modifier-for-k8s-fips container image";
      "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
