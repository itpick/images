{ buildCLIImage, pkgs, lib, ... }:

# Image: etcd
# Reference: https://images.chainguard.dev/directory/image/etcd/overview

# Packages available in nixpkgs:
#   pkgs.etcd  # etcd-3.6 (3.6.6-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement etcd image
throw "Image 'etcd' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.etcd;
#   name = "etcd";
#   tag = "v${pkgs.etcd.version}";
#   entrypoint = [ "${pkgs.etcd}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "etcd";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
