{ buildCLIImage, pkgs, lib, ... }:

# Image: vitess-lite
# Reference: https://images.chainguard.dev/directory/image/vitess-lite/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.bzip2  # bzip2 (1.0.8-r21)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.esbuild  # esbuild (0.27.1-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.gnupg  # gnupg (2.4.8-r3)
#   pkgs.gnutls  # gnutls (3.8.11-r0)
#   pkgs.gtest  # gtest (1.17.0-r3)
#   pkgs.jemalloc  # jemalloc (5.3.0-r6)
#   pkgs.libaio  # libaio (0.3.113-r6)
#   pkgs.libassuan  # libassuan (3.0.2-r5)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libev  # libev (4.33-r9)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libfido2  # libfido2 (1.16.0-r53)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libgcrypt  # libgcrypt (1.11.2-r1)
#   pkgs.libgpg-error  # libgpg-error (1.56-r0)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libksba  # libksba (1.6.7-r2)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libtasn1  # libtasn1 (4.20.0-r5)
#   pkgs.libtirpc  # libtirpc (1.3.7-r1)
#   pkgs.libudev-zero  # libudev (258.2-r3)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nettle  # nettle (3.10.2-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.npth  # npth (1.8-r9)
#   pkgs.numactl  # numactl (2.0.19-r2)
#   pkgs.p11-kit  # p11-kit (0.25.10-r0)
#   pkgs.percona-server  # percona-server-8.0 (8.0.44.35-r1)
#   pkgs.percona-toolkit  # percona-toolkit (3.7.0-r1)
#   pkgs.percona-xtrabackup  # percona-xtrabackup-8.0 (8.0.35.34-r4)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.popt  # popt (1.19-r3)
#   pkgs.procps  # procps (4.0.5-r42)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.rsync  # rsync (3.4.1-r1)
#   pkgs.strace  # strace (6.17-r1)
#   pkgs.sysstat  # sysstat (12.7.9-r0)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.vitess  # vitess-23 (23.0.0-r3)
#   pkgs.wget  # wget (1.25.0-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)
#   pkgs.zstd  # zstd (1.5.7-r5)

# Packages NOT in nixpkgs (need custom derivations):
#   gmock (1.17.0-r3)
#   gmp-dev (6.3.0-r8)
#   gnupg-dirmngr (2.4.8-r3)
#   gnupg-gpgconf (2.4.8-r3)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libabsl2508.0.0 (20250814.1-r1)
#   libacl1 (2.3.2-r54)
#   libatomic (15.2.0-r6)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libicu78 (78.1-r0)
#   libjemalloc2 (5.3.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   liblz4-1 (1.10.0-r6)
#   libproc-2-0 (4.0.5-r42)
#   libprotobuf-lite33.1.0 (33.1-r1)
#   libprotobuf33.1.0 (33.1-r1)
#   libprotoc33.1.0 (33.1-r1)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   perl-clone (0.48.01-r1)
#   perl-dbd-percona-8.0 (5.013-r0)
#   perl-dbi (1.647-r1)
#   perl-encode-locale (1.05-r6)
#   perl-file-listing (6.16-r5)
#   perl-html-parser (3.83-r2)
#   perl-html-tagset (3.24-r5)
#   perl-http-cookies (6.11-r4)
#   perl-http-date (6.06-r6)
#   perl-http-message (7.01-r0)
#   perl-http-negotiate (6.01-r6)
#   perl-io-html (1.004-r5)
#   perl-libwww (6.81-r0)
#   perl-lwp-mediatypes (6.04-r5)
#   perl-net-http (6.24-r0)
#   perl-try-tiny (0.32-r3)
#   perl-uri (5.34-r0)
#   perl-www-robotrules (6.02-r7)
#   sqlite-libs (3.51.1-r0)
#   tcmalloc-minimal (2.17.2-r1)
#   xxhash-libs (0.8.3-r3)

# TODO: Implement vitess-lite image
throw "Image 'vitess-lite' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.bzip2;
#   name = "vitess-lite";
#   tag = "v${pkgs.bzip2.version}";
#   entrypoint = [ "${pkgs.bzip2}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "999";
#
#   labels = {
#     "org.opencontainers.image.title" = "vitess-lite";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
