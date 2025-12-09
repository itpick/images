{ buildCLIImage, pkgs, lib, ... }:

# Image: unbound
# Reference: https://images.chainguard.dev/directory/image/unbound/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libevent  # libevent (2.1.12-r8)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libsodium  # libsodium (1.0.20-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.unbound  # unbound (1.24.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   bash-binsh (5.3-r3)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   unbound-config (1.24.2-r0)
#   unbound-libs (1.24.2-r0)

# TODO: Implement unbound image
throw "Image 'unbound' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.unbound;
#   name = "unbound";
#   tag = "v${pkgs.unbound.version}";
#   entrypoint = [ "${pkgs.unbound}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "unbound";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
