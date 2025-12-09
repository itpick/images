{ buildCLIImage, pkgs, lib, ... }:

# Image: stunnel
# Reference: https://images.chainguard.dev/directory/image/stunnel/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.stunnel  # stunnel (5.76-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)

# TODO: Implement stunnel image
throw "Image 'stunnel' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.stunnel;
#   name = "stunnel";
#   tag = "v${pkgs.stunnel.version}";
#   entrypoint = [ "${pkgs.stunnel}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "stunnel";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
