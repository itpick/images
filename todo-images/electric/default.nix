{ buildCLIImage, pkgs, lib, ... }:

# Image: electric
# Reference: https://images.chainguard.dev/directory/image/electric/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   electric (1.2.7-r0)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sed (4.9-r6)

# TODO: Implement electric image
throw "Image 'electric' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "electric";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "electric";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
