{ buildCLIImage, pkgs, lib, ... }:

# Image: envoy
# Reference: https://images.chainguard.dev/directory/image/envoy/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.envoy  # envoy-1.36 (1.36.3-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.su-exec  # su-exec (0.3-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   envoy-1.36-config (1.36.3-r0)
#   envoy-1.36-oci-entrypoint (1.36.3-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

# TODO: Implement envoy image
throw "Image 'envoy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.envoy;
#   name = "envoy";
#   tag = "v${pkgs.envoy.version}";
#   entrypoint = [ "${pkgs.envoy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "envoy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
