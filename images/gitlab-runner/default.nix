{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for gitlab-runner:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.git-lfs  # git-lfs (3.7.1-r2)
#   pkgs.gitlab-runner  # gitlab-runner-18.6 (18.6.3-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   git-lfs-config (3.7.1-r2)
#   gitlab-runner-oci-entrypoint-18.6 (18.6.3-r1)
#   heimdal-libs (7.8.0-r42)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libcurl-openssl4 (8.17.0-r0)
#   libexpat1 (2.7.3-r0)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   sqlite-libs (3.51.1-r0)
#   ssl_client (3.23.0-r0)

mkImage {
  drv = pkgs.gitlab-runner;
  name = "gitlab-runner";
  tag = "v${pkgs.gitlab-runner.version}";
  entrypoint = [ "${pkgs.gitlab-runner}/bin/gitlab-runner" ];
  cmd = [ "run" ];

  extraPkgs = with pkgs; [ bash busybox curl dumb-init git git-lfs tzdata ];

  labels = {
    "org.opencontainers.image.title" = "GitLab Runner";
    "org.opencontainers.image.description" = "GitLab CI/CD runner";
    "org.opencontainers.image.version" = pkgs.gitlab-runner.version;
    "io.nix-containers.chart" = "gitlab-runner";
  };
}
