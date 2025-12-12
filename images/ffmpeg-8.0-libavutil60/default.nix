{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# ffmpeg-8.0-libavutil60
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
  name = "ffmpeg-8.0-libavutil60";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "ffmpeg-8.0-libavutil60-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "ffmpeg 8.0 liuavutil60";
      "org.opencontainers.image.description" = "ffmpeg-8.0-libavutil60 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
