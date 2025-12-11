{ mkImage, pkgs, lib, ... }:

# Calico calicoctl - Cloud native networking CLI
# https://www.tigera.io/project-calico/

mkImage {
  drv = pkgs.calicoctl;
  name = "calico-calicoctl";
  tag = "v${pkgs.calicoctl.version}";
  entrypoint = [ "${pkgs.calicoctl}/bin/calicoctl" ];
  cmd = [ "version" ];

  labels = {
    "org.opencontainers.image.title" = "Calico calicoctl";
    "org.opencontainers.image.description" = "CLI tool for managing Calico network policies";
    "org.opencontainers.image.version" = pkgs.calicoctl.version;
  };
}
