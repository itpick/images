{ buildCLIImage, pkgs, lib, ... }:

# Image: node-problem-detector
# Reference: https://images.chainguard.dev/directory/image/node-problem-detector/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libudev-zero  # libudev (258.2-r3)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.node-problem-detector  # node-problem-detector-0.8 (0.8.22-r3)

# Packages NOT in nixpkgs (need custom derivations):
#   health-checker-0.8 (0.8.22-r3)
#   ld-linux (2.42-r4)
#   libcap-dev (2.77-r0)
#   libcap-utils (2.77-r0)
#   libcrypt1 (2.42-r4)
#   libsystemd (258.2-r3)
#   libudev-dev (258.2-r3)
#   log-counter-0.8 (0.8.22-r3)
#   systemd-dev (258.2-r3)

# TODO: Implement node-problem-detector image
throw "Image 'node-problem-detector' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.node-problem-detector;
#   name = "node-problem-detector";
#   tag = "v${pkgs.node-problem-detector.version}";
#   entrypoint = [ "${pkgs.node-problem-detector}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "node-problem-detector";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
