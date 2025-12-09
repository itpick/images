{ buildCLIImage, pkgs, lib, ... }:

# Image: kube-vip-cloud-provider
# Reference: https://images.chainguard.dev/directory/image/kube-vip-cloud-provider/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kube-vip-cloud-provider (0.0.12-r7)

# TODO: Implement kube-vip-cloud-provider image
throw "Image 'kube-vip-cloud-provider' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kube-vip-cloud-provider";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kube-vip-cloud-provider";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
