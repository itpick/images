{ buildCLIImage, pkgs, lib, ... }:

# Image: harbor-trivy-adapter
# Reference: https://images.chainguard.dev/directory/image/harbor-trivy-adapter/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.trivy  # trivy (0.68.1-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   harbor-scanner-trivy (0.34.1-r1)
#   ld-linux (2.42-r4)

# TODO: Implement harbor-trivy-adapter image
throw "Image 'harbor-trivy-adapter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "harbor-trivy-adapter";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10000";
#
#   labels = {
#     "org.opencontainers.image.title" = "harbor-trivy-adapter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
