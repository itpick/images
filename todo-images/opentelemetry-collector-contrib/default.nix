{ buildCLIImage, pkgs, lib, ... }:

# Image: opentelemetry-collector-contrib
# Reference: https://images.chainguard.dev/directory/image/opentelemetry-collector-contrib/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.opentelemetry-collector-contrib  # opentelemetry-collector-contrib (0.141.0-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement opentelemetry-collector-contrib image
throw "Image 'opentelemetry-collector-contrib' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.opentelemetry-collector-contrib;
#   name = "opentelemetry-collector-contrib";
#   tag = "v${pkgs.opentelemetry-collector-contrib.version}";
#   entrypoint = [ "${pkgs.opentelemetry-collector-contrib}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "opentelemetry-collector-contrib";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
