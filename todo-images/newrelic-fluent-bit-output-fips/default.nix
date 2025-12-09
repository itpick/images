{ buildCLIImage, pkgs, lib, ... }:

# Image: newrelic-fluent-bit-output-fips
# Reference: https://images.chainguard.dev/directory/image/newrelic-fluent-bit-output-fips/overview

# Packages available in nixpkgs:
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.fluent-bit  # fluent-bit-4.2 (4.2.0-r0)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libpq  # libpq-18 (18.1-r0)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.yaml-language-server  # yaml (0.2.5-r7)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libldap-2.6 (2.6.10-r7)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libsystemd (258.2-r3)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   newrelic-fluent-bit-output-fips (2.4.0-r1)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement newrelic-fluent-bit-output-fips image
throw "Image 'newrelic-fluent-bit-output-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "newrelic-fluent-bit-output-fips";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "newrelic-fluent-bit-output-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
