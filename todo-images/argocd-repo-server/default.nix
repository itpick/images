{ buildCLIImage, pkgs, lib, ... }:

# Image: argocd-repo-server
# Reference: https://images.chainguard.dev/directory/image/argocd-repo-server/overview

# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.git-lfs  # git-lfs (3.7.1-r2)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gnupg  # gnupg (2.4.8-r3)
#   pkgs.gpg-tui  # gpg (2.4.8-r3)
#   pkgs.helm  # helm-3 (3.19.2-r2)
#   pkgs.kustomize  # kustomize (5.8.0-r1)
#   pkgs.libassuan  # libassuan (3.0.2-r5)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libgcrypt  # libgcrypt (1.11.2-r1)
#   pkgs.libgpg-error  # libgpg-error (1.56-r0)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libksba  # libksba (1.6.7-r2)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.npth  # npth (1.8-r9)
#   pkgs.openssh  # openssh (10.2_p1-r2)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)

# Packages NOT in nixpkgs (need custom derivations):
#   argo-cd-3.2-repo-server (3.2.1-r2)
#   gnupg-gpgconf (2.4.8-r3)
#   gpg-agent (2.4.8-r3)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   openssh-client (10.2_p1-r2)
#   openssh-keygen (10.2_p1-r2)
#   openssh-server (10.2_p1-r2)
#   openssh-server-config (10.2_p1-r2)
#   openssh-sftp-server (10.2_p1-r2)
#   sqlite-libs (3.51.1-r0)

# TODO: Implement argocd-repo-server image
throw "Image 'argocd-repo-server' is not yet implemented"

# Suggested implementation:
# buildCLIImage {
#   drv = pkgs.cyrus_sasl;
#   name = "argocd-repo-server";
#   tag = "v${pkgs.cyrus_sasl.version}";
#   entrypoint = [ "${pkgs.cyrus_sasl}/bin/BINARY" ];
#   cmd = [ "--help" ];
#   user = "999";
#
#   labels = {
#     "org.opencontainers.image.title" = "argocd-repo-server";
#     "org.opencontainers.image.description" = "TODO: Add description";
#   };
# }
