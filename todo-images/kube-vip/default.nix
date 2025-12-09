{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-vip
# Reference: https://images.chainguard.dev/directory/image/kube-vip/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kube-vip (1.0.2-r2)

# TODO: Implement kube-vip image
throw "Image 'kube-vip' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kube-vip";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-vip";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
