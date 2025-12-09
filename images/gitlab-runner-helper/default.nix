# gitlab-runner-helper
# =============
# Placeholder for gitlab-runner-helper container image.
# This image is referenced in Helm charts but not yet implemented.
#
# TODO: Implement this image
# Reference: Check chart-images.json for source image details
#
# Example patterns to follow:
#   - Go binary: See images/external-dns/default.nix
#   - nixpkgs package: See images/kubectl/default.nix
#   - Java app: See images/jdk/default.nix

{ ... }:


# Chainguard SBOM packages for gitlab-runner-helper:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.git-lfs  # git-lfs (3.7.1-r2)
#   pkgs.gitlab-runner  # gitlab-runner-18.6 (18.6.3-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.pcre2  # pcre2 (10.47-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   git-bootstrap (2.52.0-r0)
#   git-lfs-config (3.7.1-r2)
#   gitlab-runner-helper-18.6 (18.6.3-r1)
#   gitlab-runner-helper-oci-entrypoint-18.6 (18.6.3-r1)
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-16-0 (10.47-r0)
#   libpcre2-32-0 (10.47-r0)
#   libpcre2-8-0 (10.47-r0)
#   libpcre2-posix-3 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   miniperl (5.42.0-r1)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   posix-libc-utils (2.42-r4)
#   scanelf (1.3.10-r0)
#   ssl_client (3.23.0-r0)

throw "Image 'gitlab-runner-helper' is not yet implemented. See default.nix for implementation notes."
