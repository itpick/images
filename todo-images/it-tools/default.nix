{ buildCLIImage, pkgs, lib, ... }:

# Image: it-tools
# Reference: https://images.chainguard.dev/directory/image/it-tools/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.gettext  # gettext (0.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.it-tools  # it-tools (2024.10.22-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nginxmainline  # nginx-mainline (1.29.3-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   docker-nginx (1.29.3-r0)
#   glibc-iconv (2.42-r4)
#   it-tools-nginx-config (2024.10.22-r4)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libgomp (15.2.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement it-tools image
throw "Image 'it-tools' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.it-tools;
#   name = "it-tools";
#   tag = "v${pkgs.it-tools.version}";
#   entrypoint = [ "${pkgs.it-tools}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "it-tools";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
