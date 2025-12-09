{ buildCLIImage, pkgs, lib, ... }:

# Image: bank-vaults
# Reference: https://images.chainguard.dev/directory/image/bank-vaults/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   bank-vaults (1.32.0-r4)
#   bank-vaults-template (1.32.0-r4)
#   ld-linux (2.42-r4)

# TODO: Implement bank-vaults image
throw "Image 'bank-vaults' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "bank-vaults";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "bank-vaults";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
