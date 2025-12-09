{ buildCLIImage, pkgs, lib, ... }:

# Image: gpu-feature-discovery
# Reference: https://images.chainguard.dev/directory/image/gpu-feature-discovery/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   gpu-feature-discovery (0.18.0-r2)
#   ld-linux (2.42-r4)

# TODO: Implement gpu-feature-discovery image
throw "Image 'gpu-feature-discovery' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "gpu-feature-discovery";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "gpu-feature-discovery";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
