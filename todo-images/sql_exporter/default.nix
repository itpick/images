{ buildCLIImage, pkgs, lib, ... }:

# Image: sql_exporter
# Reference: https://images.chainguard.dev/directory/image/sql_exporter/overview

# Packages NOT in nixpkgs (need custom derivations):
#   sql_exporter (0.18.6-r0)

# TODO: Implement sql_exporter image
throw "Image 'sql_exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "sql_exporter";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "sql_exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
