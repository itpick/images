{ buildCLIImage, pkgs, lib, ... }:

# Image: dart-runtime
# Reference: https://images.chainguard.dev/directory/image/dart-runtime/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   dart-runtime (3.10.3-r0)
#   ld-linux (2.42-r4)

# TODO: Implement dart-runtime image
throw "Image 'dart-runtime' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "dart-runtime";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "dart-runtime";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
