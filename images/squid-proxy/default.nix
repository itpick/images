{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# squid-proxy
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
  name = "squid-proxy";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "squid-proxy-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "squid-proxy";
      "org.opencontainers.image.description" = "squid-proxy container image";
    };
  };
}
