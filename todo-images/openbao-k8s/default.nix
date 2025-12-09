{ buildCLIImage, pkgs, lib, ... }:

# Image: openbao-k8s
# Reference: https://images.chainguard.dev/directory/image/openbao-k8s/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   openbao-k8s (1.4.0-r42)

# TODO: Implement openbao-k8s image
throw "Image 'openbao-k8s' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "openbao-k8s";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "100";
#
#   labels = {
#     "org.opencontainers.image.title" = "openbao-k8s";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
