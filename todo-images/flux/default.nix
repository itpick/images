{ buildCLIImage, pkgs, lib, ... }:

# Image: flux
# Reference: https://images.chainguard.dev/directory/image/flux/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.flux  # flux (2.7.5-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement flux image
throw "Image 'flux' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.flux;
#   name = "flux";
#   tag = "v${pkgs.flux.version}";
#   entrypoint = [ "${pkgs.flux}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "flux";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
