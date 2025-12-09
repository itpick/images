{ buildCLIImage, pkgs, lib, ... }:

# Image: infinispan-operator
# Reference: https://images.chainguard.dev/directory/image/infinispan-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   infinispan-operator (2.5.0-r1)

# TODO: Implement infinispan-operator image
throw "Image 'infinispan-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "infinispan-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "infinispan-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
