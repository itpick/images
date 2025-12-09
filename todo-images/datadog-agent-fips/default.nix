{ buildCLIImage, pkgs, lib, ... }:

# Image: datadog-agent-fips
# Reference: https://images.chainguard.dev/directory/image/datadog-agent-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.rep-grep  # grep (3.12-r3)
#   pkgs.libbsd  # libbsd (0.12.2-r3)
#   pkgs.libcap_ng  # libcap-ng (0.8.5-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libmd  # libmd (1.1.0-r5)
#   pkgs.libpcap  # libpcap (1.10.5-r3)
#   pkgs.libseccomp  # libseccomp (2.6.0-r1)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsemanage  # libsemanage (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.shadow  # shadow (4.18.0-r6)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   blkid (2.41.2-r2)
#   datadog-agent-core-integrations-fips (7.72.4-r1)
#   datadog-agent-fips (7.72.4-r1)
#   datadog-agent-s6-overlay-fips (7.72.4-r1)
#   datadog-security-agent-policies (0.74.0-r1)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libaudit (4.1.2-r1)
#   libblkid (2.41.2-r2)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   py3-pip-wheel (25.3-r2)
#   python-3.12-base (3.12.12-r2)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement datadog-agent-fips image
throw "Image 'datadog-agent-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.findutils;
#   name = "datadog-agent-fips";
#   tag = "v${pkgs.findutils.version}";
#   entrypoint = [ "${pkgs.findutils}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "datadog-agent-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
