{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-sql
# Reference: https://images.chainguard.dev/directory/image/crossplane-sql/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-sql (0.13.0-r2)

# TODO: Implement crossplane-sql image
throw "Image 'crossplane-sql' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-sql";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-sql";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
