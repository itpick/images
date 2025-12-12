{ mkImage, pkgs, lib, ... }:

# KubeVirt virtctl - CLI for managing KubeVirt virtual machines
# https://kubevirt.io/

mkImage {
  drv = pkgs.kubevirt;
  name = "kubevirt";
  tag = "v${pkgs.kubevirt.version}";
  entrypoint = [ "${pkgs.kubevirt}/bin/virtctl" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "KubeVirt virtctl";
    "org.opencontainers.image.description" = "CLI for managing KubeVirt VMs";
    "org.opencontainers.image.version" = pkgs.kubevirt.version;
  };
}
