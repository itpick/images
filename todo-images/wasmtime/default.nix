{ buildCLIImage, pkgs, lib, ... }:

# Image: wasmtime
# Reference: https://images.chainguard.dev/directory/image/wasmtime/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.wasmtime  # wasmtime (39.0.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement wasmtime image
throw "Image 'wasmtime' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.wasmtime;
#   name = "wasmtime";
#   tag = "v${pkgs.wasmtime.version}";
#   entrypoint = [ "${pkgs.wasmtime}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "wasmtime";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
