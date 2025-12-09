{ buildCLIImage, pkgs, lib, ... }:

# Image: dragonfly
# Reference: https://images.chainguard.dev/directory/image/dragonfly/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dragonfly-reverb  # dragonfly (1.35.1-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libbsd  # libbsd (0.12.2-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmd  # libmd (1.1.0-r5)
#   pkgs.libunwind  # libunwind (1.8.3-r1)
#   pkgs.liburing  # liburing (2.12-r0)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.net-tools  # net-tools (2.10-r31)
#   pkgs.netcat-openbsd  # netcat-openbsd (1.234-r0)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.su-exec  # su-exec (0.3-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libboost-context1.89.0 (1.89.0-r2)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   redis-benchmark-8.4 (8.4.0-r0)
#   redis-cli-8.4 (8.4.0-r0)

# TODO: Implement dragonfly image
throw "Image 'dragonfly' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dragonfly-reverb;
#   name = "dragonfly";
#   tag = "v${pkgs.dragonfly-reverb.version}";
#   entrypoint = [ "${pkgs.dragonfly-reverb}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "10000";
#
#   labels = {
#     "org.opencontainers.image.title" = "dragonfly";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
