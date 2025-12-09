{ buildCLIImage, pkgs, lib, ... }:

# Image: cc-dynamic
# Reference: https://images.chainguard.dev/directory/image/cc-dynamic/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement cc-dynamic image
throw "Image 'cc-dynamic' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cc-dynamic";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "cc-dynamic";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
