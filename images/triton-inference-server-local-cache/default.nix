{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# triton-inference-server-local-cache
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
  name = "triton-inference-server-local-cache";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "triton-inference-server-local-cache-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "triton inference server local cache";
      "org.opencontainers.image.description" = "triton-inference-server-local-cache container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
