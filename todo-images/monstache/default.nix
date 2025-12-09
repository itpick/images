{ buildCLIImage, pkgs, lib, ... }:

# Image: monstache
# Reference: https://images.chainguard.dev/directory/image/monstache/overview

# Packages available in nixpkgs:
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   monstache (6.8.0-r2)

# TODO: Implement monstache image
throw "Image 'monstache' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "monstache";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "monstache";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
