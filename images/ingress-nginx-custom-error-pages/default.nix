{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ingress-nginx-custom-error-pages
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
  name = "ingress-nginx-custom-error-pages";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ingress-nginx-custom-error-pages-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "ingress nginx custom error pages";
      "org.opencontainers.image.description" = "ingress-nginx-custom-error-pages container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
