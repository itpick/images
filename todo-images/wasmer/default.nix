{ buildCLIImage, pkgs, lib, ... }:

# Image: wasmer
# Reference: https://images.chainguard.dev/directory/image/wasmer/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.wasmer  # wasmer (6.1.0-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement wasmer image
throw "Image 'wasmer' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.wasmer;
#   name = "wasmer";
#   tag = "v${pkgs.wasmer.version}";
#   entrypoint = [ "${pkgs.wasmer}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "wasmer";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
