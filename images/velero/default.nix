{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.velero;
  name = "velero";
  tag = "v${pkgs.velero.version}";
  entrypoint = [ "${pkgs.velero}/bin/velero" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Velero";
    "org.opencontainers.image.description" = "Backup and migrate Kubernetes applications and persistent volumes";
    "org.opencontainers.image.version" = pkgs.velero.version;
    "io.nix-containers.chart" = "velero";
  };
}
