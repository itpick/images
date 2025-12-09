{ buildCLIImage, pkgs, lib, ... }:

# Image: xeol
# Reference: https://images.chainguard.dev/directory/image/xeol/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.xeol  # xeol (0.10.8-r20)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement xeol image
throw "Image 'xeol' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.xeol;
#   name = "xeol";
#   tag = "v${pkgs.xeol.version}";
#   entrypoint = [ "${pkgs.xeol}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "xeol";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
