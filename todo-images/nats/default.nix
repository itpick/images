{ buildCLIImage, pkgs, lib, ... }:

# Image: nats
# Reference: https://images.chainguard.dev/directory/image/nats/overview

# Packages available in nixpkgs:
#   pkgs.nats-server  # nats-server (2.12.2-r1)

# TODO: Implement nats image
throw "Image 'nats' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.nats-server;
#   name = "nats";
#   tag = "v${pkgs.nats-server.version}";
#   entrypoint = [ "${pkgs.nats-server}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "nats";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
