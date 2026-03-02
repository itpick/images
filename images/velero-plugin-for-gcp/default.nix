{ mkImage, pkgs, lib, ... }:

let
  # Create symlink at /plugins for velero plugin discovery
  pluginDir = pkgs.runCommand "velero-plugin-gcp-dir" {} ''
    mkdir -p $out/plugins
    ln -s ${pkgs.velero-plugin-for-gcp}/bin/velero-plugin-for-gcp $out/plugins/velero-plugin-for-gcp
  '';
in
mkImage {
  drv = pkgs.velero-plugin-for-gcp;
  name = "velero-plugin-for-gcp";
  tag = pkgs.velero-plugin-for-gcp.version;
  entrypoint = [ "/plugins/velero-plugin-for-gcp" ];

  extraContents = [ pluginDir ];

  labels = {
    "org.opencontainers.image.title" = "Velero Plugin for GCP";
    "org.opencontainers.image.description" = "Velero plugins for Google Cloud Platform";
    "org.opencontainers.image.version" = pkgs.velero-plugin-for-gcp.version;
  };
}
