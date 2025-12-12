{ mkImage, pkgs, lib, ... }:

# containerd - Container runtime daemon
# https://containerd.io/

mkImage {
  drv = pkgs.containerd;
  name = "containerd";
  tag = "v${pkgs.containerd.version}";
  entrypoint = [ "${pkgs.containerd}/bin/containerd" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "containerd";
    "org.opencontainers.image.description" = "Daemon to control runC";
    "org.opencontainers.image.version" = pkgs.containerd.version;
  };
}
