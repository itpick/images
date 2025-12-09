{ buildCLIImage, pkgs, lib, ... }:

# Image: kor
# Reference: https://images.chainguard.dev/directory/image/kor/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kor  # kor (0.6.6-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement kor image
throw "Image 'kor' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.kor;
#   name = "kor";
#   tag = "v${pkgs.kor.version}";
#   entrypoint = [ "${pkgs.kor}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kor";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
