{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-whisker-backend
# Reference: https://images.chainguard.dev/directory/image/calico-whisker-backend/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   calico-whisker-backend-3.31 (3.31.2-r3)
#   ld-linux (2.42-r4)

# TODO: Implement calico-whisker-backend image
throw "Image 'calico-whisker-backend' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "calico-whisker-backend";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-whisker-backend";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
