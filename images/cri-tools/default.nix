{ mkImage, pkgs, lib, ... }:

# CRI Tools - Container Runtime Interface tools
# https://github.com/kubernetes-sigs/cri-tools

mkImage {
  drv = pkgs.cri-tools;
  name = "cri-tools";
  tag = "v${pkgs.cri-tools.version}";
  entrypoint = [ "${pkgs.cri-tools}/bin/crictl" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "CRI Tools";
    "org.opencontainers.image.description" = "CLI and validation tools for Kubernetes Container Runtime Interface";
    "org.opencontainers.image.version" = pkgs.cri-tools.version;
  };
}
