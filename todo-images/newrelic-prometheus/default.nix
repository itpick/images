{ buildCLIImage, pkgs, lib, ... }:

# Image: newrelic-prometheus
# Reference: https://images.chainguard.dev/directory/image/newrelic-prometheus/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   nri-prometheus (2.27.4-r0)

# TODO: Implement newrelic-prometheus image
throw "Image 'newrelic-prometheus' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "newrelic-prometheus";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "newrelic-prometheus";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
