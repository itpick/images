{ buildCLIImage, pkgs, lib, ... }:

# Image: kubernetes-secret-generator
# Reference: https://images.chainguard.dev/directory/image/kubernetes-secret-generator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   kubernetes-secret-generator (3.4.1-r4)

# TODO: Implement kubernetes-secret-generator image
throw "Image 'kubernetes-secret-generator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "kubernetes-secret-generator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kubernetes-secret-generator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
