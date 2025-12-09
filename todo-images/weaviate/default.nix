{ buildCLIImage, pkgs, lib, ... }:

# Image: weaviate
# Reference: https://images.chainguard.dev/directory/image/weaviate/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.weaviate  # weaviate (1.34.4-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)

# TODO: Implement weaviate image
throw "Image 'weaviate' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.weaviate;
#   name = "weaviate";
#   tag = "v${pkgs.weaviate.version}";
#   entrypoint = [ "${pkgs.weaviate}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "weaviate";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
