{ buildCLIImage, pkgs, lib, ... }:

# Image: haproxy-ingress
# Reference: https://images.chainguard.dev/directory/image/haproxy-ingress/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.haproxy  # haproxy-2.4 (2.4.27-r46)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   haproxy-ingress (0.15.0-r2)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   lua-json4 (1.0.1-r1)
#   lua5.3-libs (5.3.6-r11)

# TODO: Implement haproxy-ingress image
throw "Image 'haproxy-ingress' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dumb-init;
#   name = "haproxy-ingress";
#   tag = "v${pkgs.dumb-init.version}";
#   entrypoint = [ "${pkgs.dumb-init}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "haproxy-ingress";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
