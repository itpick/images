{ buildCLIImage, pkgs, lib, ... }:

# Image: filebeat-fips
# Reference: https://images.chainguard.dev/directory/image/filebeat-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.gawk  # gawk (5.3.2-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   filebeat-9.2-oci-entrypoint (9.2.2-r2)
#   filebeat-fips-9.2 (9.2.2-r2)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   sed (4.9-r6)

# TODO: Implement filebeat-fips image
throw "Image 'filebeat-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.findutils;
#   name = "filebeat-fips";
#   tag = "v${pkgs.findutils.version}";
#   entrypoint = [ "${pkgs.findutils}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "filebeat-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
