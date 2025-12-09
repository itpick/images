{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for postgres-exporter:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gosu  # gosu (1.19-r2)
#   pkgs.libedit  # libedit (3.1-r13)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libllvm  # libllvm-19 (19.1.7-r14)
#   pkgs.libpq  # libpq-18 (18.1-r0)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.libxml2  # libxml2-16 (2.15.1-r2)
#   pkgs.libxslt  # libxslt (1.1.45-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.nss_wrapper  # nss_wrapper (1.1.16-r0)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.postgresql  # postgresql-18 (18.1-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   ecpg-18 (18.1-r0)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcom_err (1.47.3-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libldap-2.6 (2.6.10-r7)
#   liblz4-1 (1.10.0-r6)
#   libpcre2-8-0 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   libzstd1 (1.5.7-r5)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   pgaudit-18 (18.0-r1)
#   ... and 8 more

# Prometheus PostgreSQL Exporter
mkImage {
  drv = pkgs.prometheus-postgres-exporter;
  name = "postgres-exporter";
  tag = pkgs.prometheus-postgres-exporter.version;
  entrypoint = [ "${pkgs.prometheus-postgres-exporter}/bin/postgres_exporter" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "PostgreSQL Exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for PostgreSQL metrics";
    "org.opencontainers.image.version" = pkgs.prometheus-postgres-exporter.version;
    "io.nix-containers.chart" = "postgresql";
  };
}
