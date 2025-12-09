{ buildCLIImage, pkgs, lib, ... }:

# Image: vela-cli
# Reference: https://images.chainguard.dev/directory/image/vela-cli/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.expat  # expat (2.7.3-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kubevela  # kubevela (1.10.6-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   kubevela-vela-cli (1.10.6-r0)
#   ld-linux (2.42-r4)
#   libexpat1 (2.7.3-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement vela-cli image
throw "Image 'vela-cli' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.expat;
#   name = "vela-cli";
#   tag = "v${pkgs.expat.version}";
#   entrypoint = [ "${pkgs.expat}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vela-cli";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
