# kubernetes-reflector
# =============
# Placeholder for kubernetes-reflector container image.
# This image is referenced in Helm charts but not yet implemented.
#
# TODO: Implement this image
# Reference: Check chart-images.json for source image details
#
# Example patterns to follow:
#   - Go binary: See images/external-dns/default.nix
#   - nixpkgs package: See images/kubectl/default.nix
#   - Java app: See images/jdk/default.nix

{ ... }:


# Chainguard SBOM packages for kubernetes-reflector:
# Packages available in nixpkgs:
#   pkgs.dotnet-runtime_8  # dotnet-10 (10.0.100-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.icu  # icu (78.1-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libunwind  # libunwind (1.8.3-r1)
#   pkgs.lttng-ust  # lttng-ust (2.14.0-r3)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   aspnet-9-runtime (9.0.112-r2)
#   aspnet-9-targeting-pack (9.0.112-r2)
#   dotnet-9-runtime (9.0.112-r2)
#   dotnet-9-sdk (9.0.112-r2)
#   dotnet-9-targeting-pack (9.0.112-r2)
#   icu-data-full (75.1-r42)
#   icu-libs (75.1-r42)
#   icu78-data-full (78.1-r0)
#   kubernetes-reflector (9.1.44-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   netstandard-9-targeting-pack (9.0.112-r2)

throw "Image 'kubernetes-reflector' is not yet implemented. See default.nix for implementation notes."
