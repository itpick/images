{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-provider-kubernetes
# Reference: https://images.chainguard.dev/directory/image/crossplane-provider-kubernetes/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-kubernetes (1.1.0-r2)

# TODO: Implement crossplane-provider-kubernetes image
throw "Image 'crossplane-provider-kubernetes' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-provider-kubernetes";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-provider-kubernetes";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
