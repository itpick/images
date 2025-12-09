{ buildCLIImage, pkgs, lib, ... }:

# Image: doppler-kubernetes-operator
# Reference: https://images.chainguard.dev/directory/image/doppler-kubernetes-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   doppler-kubernetes-operator (1.7.1-r2)

# TODO: Implement doppler-kubernetes-operator image
throw "Image 'doppler-kubernetes-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "doppler-kubernetes-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "doppler-kubernetes-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
