{ buildCLIImage, pkgs, lib, ... }:

# Image: falcosidekick
# Reference: https://images.chainguard.dev/directory/image/falcosidekick/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   falcosidekick (2.32.0-r3)
#   ld-linux (2.42-r4)

# TODO: Implement falcosidekick image
throw "Image 'falcosidekick' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "falcosidekick";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "falcosidekick";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
