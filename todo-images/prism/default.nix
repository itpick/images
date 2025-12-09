{ buildCLIImage, pkgs, lib, ... }:

# Image: prism
# Reference: https://images.chainguard.dev/directory/image/prism/overview

# Packages available in nixpkgs:
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.nodejs  # nodejs-18 (18.20.8-r5)
#   pkgs.prism  # prism (5.14.3-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)

# TODO: Implement prism image
throw "Image 'prism' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.prism;
#   name = "prism";
#   tag = "v${pkgs.prism.version}";
#   entrypoint = [ "${pkgs.prism}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "prism";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
