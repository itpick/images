{ buildCLIImage, pkgs, lib, ... }:

# Image: filebrowser
# Reference: https://images.chainguard.dev/directory/image/filebrowser/overview

# Packages available in nixpkgs:
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.filebrowser  # filebrowser (2.50.0-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.jq  # jq (1.8.1-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.oniguruma  # oniguruma (6.9.10-r1)
#   pkgs.tini  # tini (0.19.0-r22)
#   pkgs.wget  # wget (1.25.0-r6)

# Packages NOT in nixpkgs (need custom derivations):
#   dash-binsh (0.5.13-r2)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)

# TODO: Implement filebrowser image
throw "Image 'filebrowser' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.filebrowser;
#   name = "filebrowser";
#   tag = "v${pkgs.filebrowser.version}";
#   entrypoint = [ "${pkgs.filebrowser}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "1000";
#
#   labels = {
#     "org.opencontainers.image.title" = "filebrowser";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
