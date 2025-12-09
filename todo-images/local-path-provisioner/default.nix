{ buildCLIImage, pkgs, lib, ... }:

# Image: local-path-provisioner
# Reference: https://images.chainguard.dev/directory/image/local-path-provisioner/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   local-path-provisioner (0.0.32-r3)

# TODO: Implement local-path-provisioner image
throw "Image 'local-path-provisioner' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "local-path-provisioner";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "local-path-provisioner";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
