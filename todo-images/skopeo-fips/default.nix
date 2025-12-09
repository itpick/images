{ buildCLIImage, pkgs, lib, ... }:

# Image: skopeo-fips
# Reference: https://images.chainguard.dev/directory/image/skopeo-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   containers-common (0.64.1-r0)
#   containers-image (5.36.1-r0)
#   containers-shortnames (0_git20250724-r0)
#   containers-skopeo-config (1.19.0-r0)
#   containers-storage (1.59.1-r0)
#   ld-linux (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   skopeo-fips (1.21.0-r0)

# TODO: Implement skopeo-fips image
throw "Image 'skopeo-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "skopeo-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "skopeo-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
