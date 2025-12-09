{ buildCLIImage, pkgs, lib, ... }:

# Image: qdrant
# Reference: https://images.chainguard.dev/directory/image/qdrant/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.qdrant  # qdrant (1.16.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   qdrant-oci-entrypoint (1.16.2-r0)

# TODO: Implement qdrant image
throw "Image 'qdrant' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.qdrant;
#   name = "qdrant";
#   tag = "v${pkgs.qdrant.version}";
#   entrypoint = [ "${pkgs.qdrant}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "qdrant";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
