{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for gitea:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.curl  # curl (8.17.0-r0)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.gettext  # gettext (0.26-r1)
#   pkgs.git  # git (2.52.0-r0)
#   pkgs.gitea  # gitea (1.25.2-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gnupg  # gnupg (2.4.8-r3)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nghttp3  # nghttp3 (1.13.1-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   busybox-full (1.37.0-r50)
#   ca-certificates (20251003-r0)
#   glibc-iconv (2.42-r4)
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
#   libgomp (15.2.0-r6)
#   libldap-2.6 (2.6.10-r7)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ... and 2 more

# Gitea - Self-hosted Git service
# This is a placeholder for future Gitea images
# Gitea has multiple components: server, act runner, etc.

mkImage {
  drv = pkgs.gitea;
  name = "gitea";
  tag = pkgs.gitea.version;
  entrypoint = [ "${pkgs.gitea}/bin/gitea" ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the web
  # server: `gitea web` auto-generates a default app.ini + SQLite DB on first
  # start and serves HTTP on 0.0.0.0:3000 (gitea's default bind), reachable by
  # the kind-test probe. The one thing the nonroot pod can't satisfy is the
  # default work/custom/HOME dirs under /var/lib/gitea + /home/git (not
  # writable), so point them at the writable /tmp. Operators mount a PVC there
  # and supply their own app.ini (external DB, real ROOT_URL, etc.).
  cmd = [ "web" ];
  # Chainguard runs gitea as user 1000 (git)
  user = "1000:1000";

  extraPkgs = with pkgs; [ bash curl dumb-init git gnupg ];

  env = {
    GITEA_WORK_DIR = "/tmp/gitea";
    GITEA_CUSTOM = "/tmp/gitea/custom";
    HOME = "/tmp/gitea";
    USER = "git";
  };

  labels = {
    "org.opencontainers.image.title" = "Gitea";
    "org.opencontainers.image.description" = "Self-hosted Git service";
    "org.opencontainers.image.version" = pkgs.gitea.version;
    "io.nix-containers.chart" = "gitea";
  };
}
