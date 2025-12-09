{ buildCLIImage, pkgs, lib, ... }:

# Image: perl
# Reference: https://images.chainguard.dev/directory/image/perl/overview

# Packages available in nixpkgs:
#   pkgs.bzip2  # bzip2 (1.0.8-r21)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   perl-io-socket-ssl (2.095-r0)
#   perl-mozilla-ca (20250602-r0)
#   perl-net-ssleay (1.94-r3)

# TODO: Implement perl image
throw "Image 'perl' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.perl;
#   name = "perl";
#   tag = "v${pkgs.perl.version}";
#   entrypoint = [ "${pkgs.perl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "perl";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
