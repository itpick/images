{ buildCLIImage, pkgs, lib, ... }:

# Image: hydra
# Reference: https://images.chainguard.dev/directory/image/hydra/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.hydra  # hydra (25.4.0-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement hydra image
throw "Image 'hydra' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.hydra;
#   name = "hydra";
#   tag = "v${pkgs.hydra.version}";
#   entrypoint = [ "${pkgs.hydra}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "hydra";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
