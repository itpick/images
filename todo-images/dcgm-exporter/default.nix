{ buildCLIImage, pkgs, lib, ... }:

# Image: dcgm-exporter
# Reference: https://images.chainguard.dev/directory/image/dcgm-exporter/overview

# Packages available in nixpkgs:
#   pkgs.fmt  # fmt (10.2.1-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.yaml-cpp  # yaml-cpp (0.8.0-r10)

# Packages NOT in nixpkgs (need custom derivations):
#   dcgm-cuda-13.0 (4.4.1-r4)
#   dcgm-exporter (4.4.2.4.7.0-r2)
#   dcgm-exporter-privileged (4.4.2.4.7.0-r2)
#   ld-linux (2.42-r4)
#   libboost-filesystem1.89.0 (1.89.0-r2)
#   libstdc++ (15.2.0-r6)
#   nvidia-cuda-cudart-13.0 (13.0.96-r0)
#   nvidia-cuda-ld-config-13.0 (1-r7)
#   nvidia-dcgm-libdcgmmoduleprofiling (4.4.2-r0)

# TODO: Implement dcgm-exporter image
throw "Image 'dcgm-exporter' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.fmt;
#   name = "dcgm-exporter";
#   tag = "v${pkgs.fmt.version}";
#   entrypoint = [ "${pkgs.fmt}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dcgm-exporter";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
