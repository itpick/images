{ buildCLIImage, pkgs, lib, ... }:

# Image: promitor-agent-scraper
# Reference: https://images.chainguard.dev/directory/image/promitor-agent-scraper/overview

# Packages available in nixpkgs:
#   pkgs.dotnet-runtime_8  # dotnet-10 (10.0.100-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.lttng-ust  # lttng-ust (2.14.0-r3)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   aspnet-8-runtime (8.0.122-r2)
#   dotnet-8-runtime (8.0.122-r2)
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   promitor (2.15.0-r0)

# TODO: Implement promitor-agent-scraper image
throw "Image 'promitor-agent-scraper' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dotnet-runtime_8;
#   name = "promitor-agent-scraper";
#   tag = "v${pkgs.dotnet-runtime_8.version}";
#   entrypoint = [ "${pkgs.dotnet-runtime_8}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "promitor-agent-scraper";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
