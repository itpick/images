{ buildCLIImage, pkgs, lib, ... }:

# Image: k8s_gateway
# Reference: https://images.chainguard.dev/directory/image/k8s_gateway/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   k8s_gateway (1.6.1-r2)
#   ld-linux (2.42-r4)

# TODO: Implement k8s_gateway image
throw "Image 'k8s_gateway' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "k8s_gateway";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "k8s_gateway";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
