{ buildCLIImage, pkgs, lib, ... }:

# Image: victoria-metrics
# Reference: https://images.chainguard.dev/directory/image/victoria-metrics/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.victoriametrics  # victoriametrics (1.131.0-r1)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)

# TODO: Implement victoria-metrics image
throw "Image 'victoria-metrics' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.victoriametrics;
#   name = "victoria-metrics";
#   tag = "v${pkgs.victoriametrics.version}";
#   entrypoint = [ "${pkgs.victoriametrics}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "victoria-metrics";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
