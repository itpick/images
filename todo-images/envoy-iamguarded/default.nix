{ buildCLIImage, pkgs, lib, ... }:

# Image: envoy-iamguarded
# Reference: https://images.chainguard.dev/directory/image/envoy-iamguarded/overview

# Packages available in nixpkgs:
#   pkgs.envoy  # envoy-1.36 (1.36.3-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement envoy-iamguarded image
throw "Image 'envoy-iamguarded' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.envoy;
#   name = "envoy-iamguarded";
#   tag = "v${pkgs.envoy.version}";
#   entrypoint = [ "${pkgs.envoy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "envoy-iamguarded";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
