{ buildCLIImage, pkgs, lib, ... }:

# Image: dart
# Reference: https://images.chainguard.dev/directory/image/dart/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dart  # dart (3.10.3-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   dart-runtime (3.10.3-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement dart image
throw "Image 'dart' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dart;
#   name = "dart";
#   tag = "v${pkgs.dart.version}";
#   entrypoint = [ "${pkgs.dart}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "dart";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
