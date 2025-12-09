{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-runner-helper-fips
# Reference: https://images.chainguard.dev/directory/image/gitlab-runner-helper-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.pcre2  # pcre2 (10.47-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   git-bootstrap (2.52.0-r0)
#   git-lfs-fips (3.7.1-r2)
#   git-lfs-fips-config (3.7.1-r2)
#   gitlab-runner-fips-18.6 (18.6.3-r0)
#   gitlab-runner-helper-fips-18.6 (18.6.3-r0)
#   gitlab-runner-helper-oci-entrypoint-fips-18.6 (18.6.3-r0)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-16-0 (10.47-r0)
#   libpcre2-32-0 (10.47-r0)
#   libpcre2-8-0 (10.47-r0)
#   libpcre2-posix-3 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   miniperl (5.42.0-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   posix-libc-utils (2.42-r4)
#   scanelf (1.3.10-r0)
#   ssl_client (3.23.0-r0)

# TODO: Implement gitlab-runner-helper-fips image
throw "Image 'gitlab-runner-helper-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dumb-init;
#   name = "gitlab-runner-helper-fips";
#   tag = "v${pkgs.dumb-init.version}";
#   entrypoint = [ "${pkgs.dumb-init}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-runner-helper-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
