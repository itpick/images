{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.wait4x;
  name = "wait4x";
  tag = pkgs.wait4x.version;
  entrypoint = [ "${pkgs.wait4x}/bin/wait4x" ];

  labels = {
    "org.opencontainers.image.title" = "wait4x";
    "org.opencontainers.image.description" = "Wait for services to be available";
    "org.opencontainers.image.version" = pkgs.wait4x.version;
  };
}
