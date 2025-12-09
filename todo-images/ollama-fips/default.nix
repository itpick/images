{ buildCLIImage, pkgs, lib, ... }:

# Image: ollama-fips
# Reference: https://images.chainguard.dev/directory/image/ollama-fips/overview

# Packages available in nixpkgs:
#   pkgs.cudatoolkit  # cuda-toolkit-12.8 (12.8-r4)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.ollama-cpu  # ollama-cpu (0.13.1-r0)
#   pkgs.ollama-cuda  # ollama-cuda-12.8 (0.13.0-r0)
#   pkgs.openssl  # openssl (3.6.0-r4)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   nvidia-cuda-cudart-12.8 (12.8.90-r3)
#   nvidia-cuda-cupti-12.8 (12.8.90-r2)
#   nvidia-cuda-ld-config-12.8 (1-r7)
#   nvidia-cuda-nvcc-12.8 (12.8.93-r5)
#   nvidia-cuda-nvml-dev-12.8 (12.8.90-r4)
#   nvidia-cuda-nvrtc-12.8 (12.8.93-r2)
#   nvidia-cuda-nvtx-12.8 (12.8.90-r2)
#   nvidia-libcublas-12.8 (12.8.4.1-r1)
#   nvidia-libcufft-12.8 (11.3.3.83-r2)
#   nvidia-libcurand-12.8 (10.3.9.90-r2)
#   nvidia-libcusolver-12.8 (11.7.3.90-r2)
#   nvidia-libcusparse-12.8 (12.5.8.93-r3)
#   nvidia-libnvjitlink-12.8 (12.8.93-r2)
#   ollama-fips (0.13.1-r0)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement ollama-fips image
throw "Image 'ollama-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cudatoolkit;
#   name = "ollama-fips";
#   tag = "v${pkgs.cudatoolkit.version}";
#   entrypoint = [ "${pkgs.cudatoolkit}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "ollama-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
