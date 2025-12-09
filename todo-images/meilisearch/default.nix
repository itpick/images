{ buildCLIImage, pkgs, lib, ... }:

# Image: meilisearch
# Reference: https://images.chainguard.dev/directory/image/meilisearch/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.meilisearch  # meilisearch (1.28.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement meilisearch image
throw "Image 'meilisearch' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.meilisearch;
#   name = "meilisearch";
#   tag = "v${pkgs.meilisearch.version}";
#   entrypoint = [ "${pkgs.meilisearch}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "999";
#
#   labels = {
#     "org.opencontainers.image.title" = "meilisearch";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
