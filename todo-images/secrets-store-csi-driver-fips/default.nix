{ buildCLIImage, pkgs, lib, ... }:

# Image: secrets-store-csi-driver-fips
# Reference: https://images.chainguard.dev/directory/image/secrets-store-csi-driver-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libsmartcols  # libsmartcols (2.41.2-r2)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.umount  # umount (2.41.2-r2)
#   pkgs.util-linux  # util-linux (2.41.2-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libcrypto3 (3.6.0-r4)
#   libfdisk (2.41.2-r2)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   secrets-store-csi-driver-fips (1.5.4-r3)
#   setarch (2.41.2-r2)
#   sqlite-libs (3.51.1-r0)
#   util-linux-misc (2.41.2-r2)

# TODO: Implement secrets-store-csi-driver-fips image
throw "Image 'secrets-store-csi-driver-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "secrets-store-csi-driver-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "secrets-store-csi-driver-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
