{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ffmpeg-cuda-7.1-nozeromq
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
  name = "ffmpeg-cuda-7.1-nozeromq";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ffmpeg-cuda-7.1-nozeromq-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "ffmpeg cuda 7.1 nozeromq";
      "org.opencontainers.image.description" = "ffmpeg-cuda-7.1-nozeromq container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
