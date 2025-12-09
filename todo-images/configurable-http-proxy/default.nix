{ buildCLIImage, pkgs, lib, ... }:

# Image: configurable-http-proxy
# Reference: https://images.chainguard.dev/directory/image/configurable-http-proxy/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.configurable-http-proxy  # configurable-http-proxy (5.1.0-r0)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.nodejs  # nodejs-18 (18.20.8-r5)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)

# TODO: Implement configurable-http-proxy image
throw "Image 'configurable-http-proxy' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.configurable-http-proxy;
#   name = "configurable-http-proxy";
#   tag = "v${pkgs.configurable-http-proxy.version}";
#   entrypoint = [ "${pkgs.configurable-http-proxy}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "configurable-http-proxy";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
