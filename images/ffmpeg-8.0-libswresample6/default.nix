{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ffmpeg-8.0-libswresample6
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
  name = "ffmpeg-8.0-libswresample6";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ffmpeg-8.0-libswresample6-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "ffmpeg 8.0 liuswresample6";
      "org.opencontainers.image.description" = "ffmpeg-8.0-libswresample6 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
