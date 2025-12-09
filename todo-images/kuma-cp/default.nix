{ buildCLIImage, pkgs, lib, ... }:

# Image: kuma-cp
# Reference: https://images.chainguard.dev/directory/image/kuma-cp/overview

# Packages available in nixpkgs:
#   pkgs.kuma-cp  # kuma-cp-2.9 (2.9.10-r2)

# TODO: Implement kuma-cp image
throw "Image 'kuma-cp' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.kuma-cp;
#   name = "kuma-cp";
#   tag = "v${pkgs.kuma-cp.version}";
#   entrypoint = [ "${pkgs.kuma-cp}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kuma-cp";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
