{ buildCLIImage, pkgs, lib, ... }:

# Image: go-ipfs
# Reference: https://images.chainguard.dev/directory/image/go-ipfs/overview

# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.findutils  # findutils (4.10.0-r4)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gosu  # gosu (1.19-r2)
#   pkgs.kubo  # kubo (0.39.0-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.tini  # tini (0.19.0-r22)

# Packages NOT in nixpkgs (need custom derivations):
#   dash-binsh (0.5.13-r2)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)

# TODO: Implement go-ipfs image
throw "Image 'go-ipfs' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.dash;
#   name = "go-ipfs";
#   tag = "v${pkgs.dash.version}";
#   entrypoint = [ "${pkgs.dash}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "go-ipfs";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
