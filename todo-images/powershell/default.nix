{ buildCLIImage, pkgs, lib, ... }:

# Image: powershell
# Reference: https://images.chainguard.dev/directory/image/powershell/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dotnet-runtime_8  # dotnet-10 (10.0.100-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.less  # less (688-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libunwind  # libunwind (1.8.3-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.lttng-ust  # lttng-ust (2.14.0-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.powershell  # powershell (7.5.4-r0)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aspnet-9-runtime (9.0.112-r2)
#   dotnet-9-runtime (9.0.112-r2)
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libpsl-native (7.4.0-r6)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)

# TODO: Implement powershell image
throw "Image 'powershell' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.powershell;
#   name = "powershell";
#   tag = "v${pkgs.powershell.version}";
#   entrypoint = [ "${pkgs.powershell}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "powershell";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
