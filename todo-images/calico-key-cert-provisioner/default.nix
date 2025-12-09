{ buildCLIImage, pkgs, lib, ... }:

# Image: calico-key-cert-provisioner
# Reference: https://images.chainguard.dev/directory/image/calico-key-cert-provisioner/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   calico-key-cert-provisioner-3.31 (3.31.2-r3)
#   ld-linux (2.42-r4)

# TODO: Implement calico-key-cert-provisioner image
throw "Image 'calico-key-cert-provisioner' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "calico-key-cert-provisioner";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "calico-key-cert-provisioner";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
