{ buildCLIImage, pkgs, lib, ... }:

# Image: cert-manager-csi-driver-fips
# Reference: https://images.chainguard.dev/directory/image/cert-manager-csi-driver-fips/overview

# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.mount  # mount (2.41.2-r2)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.umount  # umount (2.41.2-r2)

# Packages NOT in nixpkgs (need custom derivations):
#   ld-linux (2.42-r4)
#   libblkid (2.41.2-r2)
#   libcrypto3 (3.6.0-r4)
#   libeconf (0.8.1-r0)
#   libmount (2.41.2-r2)
#   libpcre2-8-0 (10.47-r0)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)

# TODO: Implement cert-manager-csi-driver-fips image
throw "Image 'cert-manager-csi-driver-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "cert-manager-csi-driver-fips";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "cert-manager-csi-driver-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
