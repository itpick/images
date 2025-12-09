{ buildCLIImage, pkgs, lib, ... }:

# Image: gitlab-mailroom-fips
# Reference: https://images.chainguard.dev/directory/image/gitlab-mailroom-fips/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.less  # less (688-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpq  # libpq-18 (18.1-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.ruby  # ruby-3.2 (3.2.9-r2)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libicu78 (78.1-r0)
#   libjemalloc2 (5.3.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   libproc-2-0 (4.0.5-r42)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   ruby3.2-charlock_holmes (0.7.9-r4)
#   ruby3.2-connection_pool (3.0.1-r0)
#   ruby3.2-date (3.5.0-r0)
#   ruby3.2-faraday (2.14.0-r0)
#   ruby3.2-faraday-net_http (3.4.2-r0)
#   ruby3.2-gitlab-mail_room (0.0.27-r0)
#   ruby3.2-hashie (5.0.0-r5)
#   ruby3.2-json (2.17.1-r0)
#   ruby3.2-jwt (3.1.2-r1)
#   ruby3.2-multi_xml (0.7.2-r2)
#   ruby3.2-net-http (0.8.0-r0)
#   ruby3.2-net-imap (0.5.12-r0)
#   ruby3.2-net-protocol (0.2.2-r10)
#   ruby3.2-oauth2 (2.0.18-r0)
#   ruby3.2-pg (1.6.2-r0)
#   ruby3.2-rack (3.2.4-r0)
#   ruby3.2-redis (5.4.1-r0)
#   ruby3.2-redis-client (0.26.1-r0)
#   ruby3.2-redis-namespace (1.11.0-r7)
#   ruby3.2-ruby2_keywords (0.0.5-r5)
#   ruby3.2-snaky_hash (2.0.3-r1)
#   ruby3.2-timeout (0.4.4-r0)
#   ruby3.2-version_gem (1.1.9-r0)
#   ruby3.2-webrick (1.9.2-r0)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement gitlab-mailroom-fips image
throw "Image 'gitlab-mailroom-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "gitlab-mailroom-fips";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "gitlab-mailroom-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
