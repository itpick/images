{ buildCLIImage, pkgs, lib, ... }:

# Image: eclipse-mosquitto
# Reference: https://images.chainguard.dev/directory/image/eclipse-mosquitto/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.cjson  # cjson (1.7.19-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libwebsockets  # libwebsockets (4.5.2-r0)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.mosquitto  # mosquitto (2.0.22-r4)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   mosquitto-clients (2.0.22-r4)
#   mosquitto-libs (2.0.22-r4)
#   mosquitto-libs++ (2.0.22-r4)

# TODO: Implement eclipse-mosquitto image
throw "Image 'eclipse-mosquitto' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "eclipse-mosquitto";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1883";
#
#   labels = {
#     "org.opencontainers.image.title" = "eclipse-mosquitto";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
