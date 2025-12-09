{ buildCLIImage, pkgs, lib, ... }:

# Image: dotnet-runtime-fips
# Reference: https://images.chainguard.dev/directory/image/dotnet-runtime-fips/overview

# Packages available in nixpkgs:
#   pkgs.dotnet-runtime_8  # dotnet-10 (10.0.100-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libunwind  # libunwind (1.8.3-r1)
#   pkgs.lttng-ust  # lttng-ust (2.14.0-r3)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   dotnet-10-runtime (10.0.100-r1)
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement dotnet-runtime-fips image
throw "Image 'dotnet-runtime-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dotnet-runtime_8;
#   name = "dotnet-runtime-fips";
#   tag = "v${pkgs.dotnet-runtime_8.version}";
#   entrypoint = [ "${pkgs.dotnet-runtime_8}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "dotnet-runtime-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
