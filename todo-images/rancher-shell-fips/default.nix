{ buildCLIImage, pkgs, lib, ... }:

# Image: rancher-shell-fips
# Reference: https://images.chainguard.dev/directory/image/rancher-shell-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.bash-completion  # bash-completion (2.17.0-r0)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gnutar  # gnutar (1.35-r6)
#   pkgs.gzip  # gzip (1.14-r2)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.vim  # vim (9.1.1957-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   gnutar-rmt (1.35-r6)
#   heimdal-libs (7.8.0-r42)
#   helm-fips-4 (4.0.1-r2)
#   k9s-fips (0.50.16-r6)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   kubectl-bash-completion-fips-1.33 (1.33.6-r2)
#   kubectl-fips-1.33 (1.33.6-r2)
#   kubectl-fips-1.33-default (1.33.6-r2)
#   kustomize-fips (5.8.0-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libldap-2.6 (2.6.10-r7)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   posix-libc-utils (2.42-r4)
#   rancher-shell-fips-0.5 (0.5.1-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement rancher-shell-fips image
throw "Image 'rancher-shell-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.bash-completion;
#   name = "rancher-shell-fips";
#   tag = "v${pkgs.bash-completion.version}";
#   entrypoint = [ "${pkgs.bash-completion}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "rancher-shell-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
