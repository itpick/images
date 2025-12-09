{ buildCLIImage, pkgs, lib, ... }:

# Image: vt
# Reference: https://images.chainguard.dev/directory/image/vt/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.vt-cli  # vt-cli (1.2.0-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement vt image
throw "Image 'vt' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.vt-cli;
#   name = "vt";
#   tag = "v${pkgs.vt-cli.version}";
#   entrypoint = [ "${pkgs.vt-cli}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vt";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
