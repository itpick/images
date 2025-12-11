{ mkImage, pkgs, lib, ... }:

let
  # Create symlink at /velero for helm chart compatibility
  veleroSymlink = pkgs.runCommand "velero-symlink" {} ''
    mkdir -p $out
    ln -s ${pkgs.velero}/bin/velero $out/velero
  '';
in
mkImage {
  drv = pkgs.velero;
  name = "velero";
  tag = pkgs.velero.version;
  entrypoint = [ "/velero" ];
  cmd = [ "server" ];

  extraPkgs = with pkgs; [ restic ];
  extraContents = [ veleroSymlink ];

  labels = {
    "org.opencontainers.image.title" = "Velero";
    "org.opencontainers.image.description" = "Backup and migrate Kubernetes applications and persistent volumes";
    "org.opencontainers.image.version" = pkgs.velero.version;
    "io.nix-containers.chart" = "velero";
  };
}
