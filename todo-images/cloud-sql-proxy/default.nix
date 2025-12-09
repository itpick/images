{ buildCLIImage, pkgs, lib, ... }:

# Image: cloud-sql-proxy
# Reference: https://images.chainguard.dev/directory/image/cloud-sql-proxy/overview

# Packages NOT in nixpkgs (need custom derivations):
#   cloud-sql-proxy-2.18 (2.18.3-r2)

# TODO: Implement cloud-sql-proxy image
throw "Image 'cloud-sql-proxy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "cloud-sql-proxy";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cloud-sql-proxy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
