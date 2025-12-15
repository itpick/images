{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# zipkin-slim
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
  name = "zipkin-slim";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "zipkin-slim-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "zipkin slim";
      "org.opencontainers.image.description" = "zipkin-slim container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
