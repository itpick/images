{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ingress-nginx-opentelemetry-plugin
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
  name = "ingress-nginx-opentelemetry-plugin";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ingress-nginx-opentelemetry-plugin-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "ingress nginx opentelemetry plugin";
      "org.opencontainers.image.description" = "ingress-nginx-opentelemetry-plugin container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
