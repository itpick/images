{ buildCLIImage, pkgs, lib, ... }:

# Image: nvidia-device-plugin
# Reference: https://images.chainguard.dev/directory/image/nvidia-device-plugin/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   gpu-feature-discovery (0.18.0-r2)
#   k8s-device-plugin (0.18.0-r2)
#   ld-linux (2.42-r4)
#   mps-control-daemon (0.18.0-r2)
#   nvidia-device-plugin (0.18.0-r2)

# TODO: Implement nvidia-device-plugin image
throw "Image 'nvidia-device-plugin' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "nvidia-device-plugin";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "nvidia-device-plugin";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
