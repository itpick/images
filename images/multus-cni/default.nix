{ mkImage, pkgs, lib, ... }:

# multus-cni - Multi-network CNI plugin for Kubernetes
# https://github.com/k8snetworkplumbingwg/multus-cni

mkImage {
  drv = pkgs.multus-cni;
  name = "multus-cni";
  tag = "v${pkgs.multus-cni.version}";
  entrypoint = [ "${pkgs.multus-cni}/bin/multus" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Multus CNI";
    "org.opencontainers.image.description" = "Multi-network CNI plugin for Kubernetes";
    "org.opencontainers.image.version" = pkgs.multus-cni.version;
  };
}
