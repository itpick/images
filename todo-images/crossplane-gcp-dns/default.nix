{ buildCLIImage, pkgs, lib, ... }:

# Image: crossplane-gcp-dns
# Reference: https://images.chainguard.dev/directory/image/crossplane-gcp-dns/overview

# Packages NOT in nixpkgs (need custom derivations):
#   crossplane-provider-gcp-dns (2.3.0-r0)

# TODO: Implement crossplane-gcp-dns image
throw "Image 'crossplane-gcp-dns' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "crossplane-gcp-dns";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "crossplane-gcp-dns";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
