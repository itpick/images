{ buildCLIImage, pkgs, lib, ... }:

# Image: psqlodbc
# Reference: https://images.chainguard.dev/directory/image/psqlodbc/overview

# Packages available in nixpkgs:
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libpq  # libpq-18 (18.1-r0)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.psqlodbc  # psqlodbc (17.00.0007-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.unixodbc  # unixodbc (2.3.14-r0)

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
#   libltdl (2.5.4-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement psqlodbc image
throw "Image 'psqlodbc' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.psqlodbc;
#   name = "psqlodbc";
#   tag = "v${pkgs.psqlodbc.version}";
#   entrypoint = [ "${pkgs.psqlodbc}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "psqlodbc";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
