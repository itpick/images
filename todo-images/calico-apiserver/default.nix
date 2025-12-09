{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-apiserver
# Reference: https://images.chainguard.dev/directory/image/calico-apiserver/overview

# Packages available in nixpkgs:
#   pkgs.calico-apiserver  # calico-apiserver-3.31 (3.31.2-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)

# TODO: Implement calico-apiserver image
throw "Image 'calico-apiserver' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.calico-apiserver;
#   name = "calico-apiserver";
#   tag = "v${pkgs.calico-apiserver.version}";
#   entrypoint = [ "${pkgs.calico-apiserver}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-apiserver";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
