{ buildCLIImage, pkgs, lib, ... }:

# Image: kuma-dp
# Reference: https://images.chainguard.dev/directory/image/kuma-dp/overview

# Packages available in nixpkgs:
#   pkgs.envoy  # envoy-1.30 (1.30.11-r4)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.kuma-dp  # kuma-dp-2.9 (2.9.10-r2)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   kuma-coredns-1.13 (1.13.1-r3)
#   ld-linux (2.42-r4)

# TODO: Implement kuma-dp image
throw "Image 'kuma-dp' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.kuma-dp;
#   name = "kuma-dp";
#   tag = "v${pkgs.kuma-dp.version}";
#   entrypoint = [ "${pkgs.kuma-dp}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "kuma-dp";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
