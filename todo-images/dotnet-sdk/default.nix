{ buildCLIImage, pkgs, lib, ... }:

# Image: dotnet-sdk
# Reference: https://images.chainguard.dev/directory/image/dotnet-sdk/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dotnet-runtime_8  # dotnet-10 (10.0.100-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libunwind  # libunwind (1.8.3-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.lttng-ust  # lttng-ust (2.14.0-r3)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aspnet-10-runtime (10.0.100-r1)
#   aspnet-10-targeting-pack (10.0.100-r1)
#   dotnet-10-runtime (10.0.100-r1)
#   dotnet-10-sdk (10.0.100-r1)
#   dotnet-10-targeting-pack (10.0.100-r1)
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)

# TODO: Implement dotnet-sdk image
throw "Image 'dotnet-sdk' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dotnet-runtime_8;
#   name = "dotnet-sdk";
#   tag = "v${pkgs.dotnet-runtime_8.version}";
#   entrypoint = [ "${pkgs.dotnet-runtime_8}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dotnet-sdk";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
