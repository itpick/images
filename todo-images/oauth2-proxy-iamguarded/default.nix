{ buildCLIImage, pkgs, lib, ... }:

# Image: oauth2-proxy-iamguarded
# Reference: https://images.chainguard.dev/directory/image/oauth2-proxy-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.oauth2-proxy  # oauth2-proxy (7.13.0-r1)

# TODO: Implement oauth2-proxy-iamguarded image
throw "Image 'oauth2-proxy-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.oauth2-proxy;
#   name = "oauth2-proxy-iamguarded";
#   tag = "v${pkgs.oauth2-proxy.version}";
#   entrypoint = [ "${pkgs.oauth2-proxy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "oauth2-proxy-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
