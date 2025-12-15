{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# kserve-rest-proxy
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
  name = "kserve-rest-proxy";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "kserve-rest-proxy-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "kserve-rest-proxy";
      "org.opencontainers.image.description" = "kserve-rest-proxy container image";
    };
  };
}
