{ buildCLIImage, pkgs, lib, ... }:

# Image: spicedb
# Reference: https://images.chainguard.dev/directory/image/spicedb/overview

# Packages available in nixpkgs:
#   pkgs.grpc-health-probe  # grpc-health-probe (0.4.42-r0)
#   pkgs.spicedb  # spicedb (1.47.1-r0)

# TODO: Implement spicedb image
throw "Image 'spicedb' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.spicedb;
#   name = "spicedb";
#   tag = "v${pkgs.spicedb.version}";
#   entrypoint = [ "${pkgs.spicedb}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "spicedb";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
