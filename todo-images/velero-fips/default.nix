{ buildCLIImage, pkgs, lib, ... }:

# Image: velero-fips
# Reference: https://images.chainguard.dev/directory/image/velero-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   restic-fips (0.18.1-r2)
#   velero-fips (1.17.1-r1)
#   velero-restore-helper-fips (1.17.1-r1)

# TODO: Implement velero-fips image
throw "Image 'velero-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "velero-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "velero-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
