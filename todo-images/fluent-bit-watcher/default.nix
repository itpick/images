{ buildCLIImage, pkgs, lib, ... }:

# Image: fluent-bit-watcher
# Reference: https://images.chainguard.dev/directory/image/fluent-bit-watcher/overview

# Packages available in nixpkgs:
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.fluent-bit  # fluent-bit-4.2 (4.2.0-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libpq  # libpq-18 (18.1-r0)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.ruby  # ruby-3.2 (3.2.9-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   fluent-plugin-systemd (1.1.1-r0)
#   fluent-watcher (3.5.0-r2)
#   fluent-watcher-config (3.5.0-r2)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libjemalloc2 (5.3.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libsystemd (258.2-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   ruby3.2-async (2.21.1-r1)
#   ruby3.2-async-http (0.92.1-r0)
#   ruby3.2-async-io (1.43.2-r3)
#   ruby3.2-async-pool (0.11.0-r1)
#   ruby3.2-base64 (0.3.0-r1)
#   ruby3.2-bundler (4.0.0-r0)
#   ruby3.2-concurrent-ruby (1.3.5-r0)
#   ruby3.2-console (1.34.2-r0)
#   ruby3.2-cool.io (1.9.0-r2)
#   ruby3.2-csv (3.3.5-r1)
#   ruby3.2-drb (2.2.3-r1)
#   ruby3.2-ffi (1.17.2-r1)
#   ruby3.2-fiber-annotation (0.2.0-r2)
#   ruby3.2-fiber-local (1.1.0-r3)
#   ruby3.2-fiber-storage (1.0.1-r1)
#   ruby3.2-fluentd-1.19 (1.19.1-r0)
#   ruby3.2-http_parser.rb (0.8.0-r7)
#   ruby3.2-io-endpoint (0.16.0-r0)
#   ruby3.2-io-event (1.7.1-r2)
#   ruby3.2-io-stream (0.11.1-r0)
#   ruby3.2-json (2.17.1-r0)
#   ruby3.2-logger (1.7.0-r0)
#   ruby3.2-metrics (0.15.0-r0)
#   ruby3.2-msgpack (1.8.0-r0)
#   ruby3.2-protocol-hpack (1.5.1-r2)
#   ruby3.2-protocol-http (0.55.0-r0)
#   ruby3.2-protocol-http1 (0.35.2-r0)
#   ruby3.2-protocol-http2 (0.23.0-r0)
#   ruby3.2-protocol-url (0.4.0-r0)
#   ruby3.2-serverengine (2.4.0-r2)
#   ruby3.2-sigdump (0.2.5-r5)
#   ruby3.2-strptime (0.2.5-r7)
#   ruby3.2-systemd-journal (2.1.1-r1)
#   ruby3.2-timers (4.4.0-r1)
#   ruby3.2-traces (0.18.2-r0)
#   ruby3.2-tzinfo (2.0.6-r10)
#   ruby3.2-tzinfo-data (1.2025.2-r1)
#   ruby3.2-uri (1.0.4-r0)
#   ruby3.2-webrick (1.9.2-r0)
#   ruby3.2-yajl-ruby (1.4.3-r9)
#   ruby3.2-zstd-ruby (1.5.7.0-r1)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement fluent-bit-watcher image
throw "Image 'fluent-bit-watcher' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "fluent-bit-watcher";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "—";
#
#   labels = {
#     "org.opencontainers.image.title" = "fluent-bit-watcher";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
