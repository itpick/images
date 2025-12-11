# ffmpeg
# =============
# FFmpeg - Complete solution for recording, converting, and streaming
# https://ffmpeg.org/
#
# FFmpeg is a collection of libraries and tools to process multimedia
# content such as audio, video, subtitles, and related metadata.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.ffmpeg;
  name = "ffmpeg";
  tag = "v${pkgs.ffmpeg.version}";
  entrypoint = [ "${pkgs.ffmpeg}/bin/ffmpeg" ];
  cmd = [ "-version" ];

  extraPkgs = with pkgs; [
    bash
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "FFmpeg";
    "org.opencontainers.image.description" = "Complete solution for recording, converting, and streaming multimedia";
    "org.opencontainers.image.version" = pkgs.ffmpeg.version;
  };
}
