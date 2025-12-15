{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# envoy-ratelimit
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
  name = "envoy-ratelimit";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "envoy-ratelimit-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "envoy ratelimit";
      "org.opencontainers.image.description" = "envoy-ratelimit container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
