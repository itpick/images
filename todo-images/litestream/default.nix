{ buildCLIImage, pkgs, lib, ... }:

# Image: litestream
# Reference: https://images.chainguard.dev/directory/image/litestream/overview

# Packages available in nixpkgs:
#   pkgs.litestream  # litestream (0.5.2-r2)
#   pkgs.tzdata  # tzdata (2025b-r2)

# TODO: Implement litestream image
throw "Image 'litestream' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.litestream;
#   name = "litestream";
#   tag = "v${pkgs.litestream.version}";
#   entrypoint = [ "${pkgs.litestream}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "litestream";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
