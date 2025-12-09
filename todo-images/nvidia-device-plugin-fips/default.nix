{ buildCLIImage, pkgs, lib, ... }:

# Image: nvidia-device-plugin-fips
# Reference: https://images.chainguard.dev/directory/image/nvidia-device-plugin-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   gpu-feature-discovery-fips (0.18.0-r2)
#   k8s-device-plugin-fips (0.18.0-r2)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   mps-control-daemon-fips (0.18.0-r2)
#   nvidia-device-plugin-fips (0.18.0-r2)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement nvidia-device-plugin-fips image
throw "Image 'nvidia-device-plugin-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "nvidia-device-plugin-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "nvidia-device-plugin-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
