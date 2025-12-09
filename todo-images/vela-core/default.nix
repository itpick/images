{ buildCLIImage, pkgs, lib, ... }:

# Image: vela-core
# Reference: https://images.chainguard.dev/directory/image/vela-core/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   kubevela-vela-core (1.10.6-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement vela-core image
throw "Image 'vela-core' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "vela-core";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "vela-core";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
