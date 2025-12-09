{ buildCLIImage, pkgs, lib, ... }:

# Image: volsync
# Reference: https://images.chainguard.dev/directory/image/volsync/overview

# Packages available in nixpkgs:
#   pkgs.acl  # acl (2.3.2-r54)
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.fuse3  # fuse3 (3.17.4-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.openssh  # openssh (10.2_p1-r2)
#   pkgs.openssl  # openssl (3.6.0-r4)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.popt  # popt (1.19-r3)
#   pkgs.rclone  # rclone (1.72.0-r1)
#   pkgs.restic  # restic (0.18.1-r3)
#   pkgs.rsync  # rsync (3.4.1-r1)
#   pkgs.stunnel  # stunnel (5.76-r0)
#   pkgs.syncthing  # syncthing (2.0.12-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   ca-certificates (20251003-r0)
#   fuse3-libs (3.17.4-r0)
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   liblz4-1 (1.10.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssh-client (10.2_p1-r2)
#   openssh-keygen (10.2_p1-r2)
#   openssh-server (10.2_p1-r2)
#   openssh-server-config (10.2_p1-r2)
#   openssh-sftp-server (10.2_p1-r2)
#   volsync (0.14.0-r1)
#   volsync-diskrsync-tcp (0.14.0-r1)
#   xxhash-libs (0.8.3-r3)

# TODO: Implement volsync image
throw "Image 'volsync' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.acl;
#   name = "volsync";
#   tag = "v${pkgs.acl.version}";
#   entrypoint = [ "${pkgs.acl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "65532";
#
#   labels = {
#     "org.opencontainers.image.title" = "volsync";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
