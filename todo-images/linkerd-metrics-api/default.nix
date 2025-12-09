{ buildCLIImage, pkgs, lib, ... }:

# Image: linkerd-metrics-api
# Reference: https://images.chainguard.dev/directory/image/linkerd-metrics-api/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   linkerd2-metrics-api (25.12.1-r0)

# TODO: Implement linkerd-metrics-api image
throw "Image 'linkerd-metrics-api' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "linkerd-metrics-api";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "linkerd-metrics-api";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
