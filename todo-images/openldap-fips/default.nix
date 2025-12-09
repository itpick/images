{ buildCLIImage, pkgs, lib, ... }:

# Image: openldap-fips
# Reference: https://images.chainguard.dev/directory/image/openldap-fips/overview

# Packages available in nixpkgs:
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libevent  # libevent (2.1.12-r8)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openldap  # openldap-2.6 (2.6.10-r7)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.unixodbc  # unixodbc (2.3.14-r0)

# Packages NOT in nixpkgs (need custom derivations):
#   heimdal-libs (7.8.0-r42)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libldap-2.6 (2.6.10-r7)
#   libltdl (2.5.4-r0)
#   libssl3 (3.6.0-r4)
#   mosquitto-libs (2.0.22-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openldap-2.6-back-asyncmeta (2.6.10-r7)
#   openldap-2.6-back-dnssrv (2.6.10-r7)
#   openldap-2.6-back-ldap (2.6.10-r7)
#   openldap-2.6-back-lload (2.6.10-r7)
#   openldap-2.6-back-mdb (2.6.10-r7)
#   openldap-2.6-back-meta (2.6.10-r7)
#   openldap-2.6-back-null (2.6.10-r7)
#   openldap-2.6-back-passwd (2.6.10-r7)
#   openldap-2.6-back-relay (2.6.10-r7)
#   openldap-2.6-back-sock (2.6.10-r7)
#   openldap-2.6-back-sql (2.6.10-r7)
#   openldap-2.6-backend-all (2.6.10-r7)
#   openldap-2.6-clients (2.6.10-r7)
#   openldap-2.6-hin (2.6.10-r7)
#   openldap-2.6-lloadd (2.6.10-r7)
#   openldap-2.6-overlay-accesslog (2.6.10-r7)
#   openldap-2.6-overlay-all (2.6.10-r7)
#   openldap-2.6-overlay-auditlog (2.6.10-r7)
#   openldap-2.6-overlay-autoca (2.6.10-r7)
#   openldap-2.6-overlay-collect (2.6.10-r7)
#   openldap-2.6-overlay-constraint (2.6.10-r7)
#   openldap-2.6-overlay-dds (2.6.10-r7)
#   openldap-2.6-overlay-deref (2.6.10-r7)
#   openldap-2.6-overlay-dyngroup (2.6.10-r7)
#   openldap-2.6-overlay-dynlist (2.6.10-r7)
#   openldap-2.6-overlay-homedir (2.6.10-r7)
#   openldap-2.6-overlay-lastbind (2.6.10-r7)
#   openldap-2.6-overlay-memberof (2.6.10-r7)
#   openldap-2.6-overlay-mqtt (2.6.10-r7)
#   openldap-2.6-overlay-otp (2.6.10-r7)
#   openldap-2.6-overlay-ppolicy (2.6.10-r7)
#   openldap-2.6-overlay-proxycache (2.6.10-r7)
#   openldap-2.6-overlay-refint (2.6.10-r7)
#   openldap-2.6-overlay-remoteauth (2.6.10-r7)
#   openldap-2.6-overlay-retcode (2.6.10-r7)
#   openldap-2.6-overlay-rwm (2.6.10-r7)
#   openldap-2.6-overlay-seqmod (2.6.10-r7)
#   openldap-2.6-overlay-sssvlv (2.6.10-r7)
#   openldap-2.6-overlay-syncprov (2.6.10-r7)
#   openldap-2.6-overlay-translucent (2.6.10-r7)
#   openldap-2.6-overlay-unique (2.6.10-r7)
#   openldap-2.6-overlay-valsort (2.6.10-r7)
#   openldap-2.6-passwd-pbkdf2 (2.6.10-r7)
#   openldap-2.6-passwd-sha2 (2.6.10-r7)
#   openssl-config-fipshardened (3.6.0-r4)
#   openssl-fips-test (0.6-r0)
#   openssl-provider-fips-3.1.2 (3.1.2-r3)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement openldap-fips image
throw "Image 'openldap-fips' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.c-ares;
#   name = "openldap-fips";
#   tag = "v${pkgs.c-ares.version}";
#   entrypoint = [ "${pkgs.c-ares}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "0";
#
#   labels = {
#     "org.opencontainers.image.title" = "openldap-fips";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
