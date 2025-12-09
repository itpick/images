{ buildCLIImage, pkgs, lib, ... }:

# Image: zot
# Reference: https://images.chainguard.dev/directory/image/zot/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   zot (2.1.11-r1)

# TODO: Implement zot image
throw "Image 'zot' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "zot";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "zot";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
