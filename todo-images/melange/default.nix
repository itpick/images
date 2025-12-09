{ buildCLIImage, pkgs, lib, ... }:

# Image: melange
# Reference: https://images.chainguard.dev/directory/image/melange/overview

# Packages available in nixpkgs:
#   pkgs.bubblewrap  # bubblewrap (0.11.0-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.melange  # melange (0.35.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   wolfi-keys (1-r12)

# TODO: Implement melange image
throw "Image 'melange' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.melange;
#   name = "melange";
#   tag = "v${pkgs.melange.version}";
#   entrypoint = [ "${pkgs.melange}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "melange";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
