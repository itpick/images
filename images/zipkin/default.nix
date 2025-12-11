{ mkImage, pkgs, lib, ... }:

# Zipkin - Distributed tracing system
# https://zipkin.io/

mkImage {
  drv = pkgs.zipkin;
  name = "zipkin";
  tag = "v${pkgs.zipkin.version}";
  entrypoint = [ "${pkgs.openjdk21_headless}/bin/java" ];
  cmd = [ "-jar" "${pkgs.zipkin}/zipkin.jar" ];

  extraPkgs = with pkgs; [ openjdk21_headless cacert ];

  labels = {
    "org.opencontainers.image.title" = "Zipkin";
    "org.opencontainers.image.description" = "Distributed tracing system";
    "org.opencontainers.image.version" = pkgs.zipkin.version;
  };
}
