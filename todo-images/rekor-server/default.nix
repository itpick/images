{ buildCLIImage, pkgs, lib, ... }:

# Image: rekor-server
# Reference: https://images.chainguard.dev/directory/image/rekor-server/overview

# Packages available in nixpkgs:
#   pkgs.rekor-server  # rekor-server (1.4.3-r2)

# TODO: Implement rekor-server image
throw "Image 'rekor-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.rekor-server;
#   name = "rekor-server";
#   tag = "v${pkgs.rekor-server.version}";
#   entrypoint = [ "${pkgs.rekor-server}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "rekor-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
