{ buildCLIImage, pkgs, lib, ... }:

# Image: azure-functions-node
# Reference: https://images.chainguard.dev/directory/image/azure-functions-node/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dotnet-runtime_8  # dotnet-10 (10.0.100-r1)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linuxheaders  # linux-headers (6.18-r0)
#   pkgs.lttng-ust  # lttng-ust (2.14.0-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nodejs  # nodejs-22 (22.21.1-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aspnet-8-runtime (8.0.122-r2)
#   azure-functions-extension-bundles-4 (4.30.0-r1)
#   azure-functions-host (4.1045.200-r0)
#   azure-functions-host-nodejs-worker (4.1045.200-r0)
#   ca-certificates (20251003-r0)
#   dotnet-8-runtime (8.0.122-r2)
#   glibc-dev (2.42-r4)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libxcrypt-dev (4.5.2-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   nss-db (2.42-r4)
#   nss-hesiod (2.42-r4)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement azure-functions-node image
throw "Image 'azure-functions-node' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "azure-functions-node";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532:65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "azure-functions-node";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
