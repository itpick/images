{ buildCLIImage, pkgs, lib, ... }:

# Image: ml-metadata-store-server
# Reference: https://images.chainguard.dev/directory/image/ml-metadata-store-server/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libstdc++ (15.2.0-r6)
#   ml-metadata-store-server (1.17.0-r3)

# TODO: Implement ml-metadata-store-server image
throw "Image 'ml-metadata-store-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "ml-metadata-store-server";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ml-metadata-store-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
