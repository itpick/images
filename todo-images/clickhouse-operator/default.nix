{ buildCLIImage, pkgs, lib, ... }:

# Image: clickhouse-operator
# Reference: https://images.chainguard.dev/directory/image/clickhouse-operator/overview

# Packages NOT in nixpkgs (need custom derivations):
#   clickhouse-operator (0.25.5-r1)

# TODO: Implement clickhouse-operator image
throw "Image 'clickhouse-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.PACKAGE_NAME;
#   name = "clickhouse-operator";
#   tag = "v${pkgs.PACKAGE_NAME.version}";
#   entrypoint = [ "${pkgs.PACKAGE_NAME}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "clickhouse-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
