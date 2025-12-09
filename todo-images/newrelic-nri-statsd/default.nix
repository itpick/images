{ buildCLIImage, pkgs, lib, ... }:

# Image: newrelic-nri-statsd
# Reference: https://images.chainguard.dev/directory/image/newrelic-nri-statsd/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   newrelic-nri-statsd (2.12.0-r1)

# TODO: Implement newrelic-nri-statsd image
throw "Image 'newrelic-nri-statsd' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "newrelic-nri-statsd";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "newrelic-nri-statsd";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
