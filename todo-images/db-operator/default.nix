{ buildCLIImage, pkgs, lib, ... }:

# Image: db-operator
# Reference: https://images.chainguard.dev/directory/image/db-operator/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libbsd  # libbsd (0.12.2-r3)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmd  # libmd (1.1.0-r5)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsemanage  # libsemanage (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.shadow  # shadow (4.18.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   db-operator (2.16.0-r3)
#   db-operator-oci-entrypoint (2.16.0-r3)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libaudit (4.1.2-r1)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)

# TODO: Implement db-operator image
throw "Image 'db-operator' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.glibc;
#   name = "db-operator";
#   tag = "v${pkgs.glibc.version}";
#   entrypoint = [ "${pkgs.glibc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1001";
#
#   labels = {
#     "org.opencontainers.image.title" = "db-operator";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
