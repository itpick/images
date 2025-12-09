{ buildCLIImage, pkgs, lib, ... }:

# Image: falcoctl
# Reference: https://images.chainguard.dev/directory/image/falcoctl/overview

# Packages available in nixpkgs:
#   pkgs.falcoctl  # falcoctl (0.11.4-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement falcoctl image
throw "Image 'falcoctl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.falcoctl;
#   name = "falcoctl";
#   tag = "v${pkgs.falcoctl.version}";
#   entrypoint = [ "${pkgs.falcoctl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "falcoctl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
