{ buildCLIImage, pkgs, lib, ... }:

# Image: spire-oidc-discovery-provider
# Reference: https://images.chainguard.dev/directory/image/spire-oidc-discovery-provider/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   spire-oidc-discovery-provider (1.13.3-r2)

# TODO: Implement spire-oidc-discovery-provider image
throw "Image 'spire-oidc-discovery-provider' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "spire-oidc-discovery-provider";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "spire-oidc-discovery-provider";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
