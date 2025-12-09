{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-csi-external-health-monitor
# Reference: https://images.chainguard.dev/directory/image/kubernetes-csi-external-health-monitor/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-csi-external-health-monitor (0.16.0-r3)

# TODO: Implement kubernetes-csi-external-health-monitor image
throw "Image 'kubernetes-csi-external-health-monitor' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-csi-external-health-monitor";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-csi-external-health-monitor";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
