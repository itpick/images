{ buildCLIImage, pkgs, lib, ... }:

# Image: graalvm-native
# Reference: https://images.chainguard.dev/directory/image/graalvm-native/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libstdc++ (15.2.0-r6)
#   libstdc++-dev (15.2.0-r6)

# TODO: Implement graalvm-native image
throw "Image 'graalvm-native' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "graalvm-native";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "graalvm-native";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
