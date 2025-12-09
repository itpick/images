{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for mariadb:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libaio  # libaio (0.3.113-r6)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.linux-pam  # linux-pam (1.7.1-r3)
#   pkgs.mariadb  # mariadb-12.1 (12.1.2-r0)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.perl  # perl (5.42.0-r1)
#   pkgs.pwgen  # pwgen (2.08-r6)
#   pkgs.tzdata  # tzdata (2025b-r2)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   libpcre2-posix-3 (10.47-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   mariadb-12.1-client (12.1.2-r0)
#   mariadb-12.1-oci-entrypoint (12.1.2-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)

let
  mariadbPackages = with pkgs; [
    mariadb
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "mariadb";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "mariadb-root";
      paths = base.basePackages ++ mariadbPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath mariadbPackages}"
      "MYSQL_DATA_DIR=/home/nonroot/data"
    ];
    ExposedPorts = {
      "3306/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "MariaDB database server";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.mariadb.version;
      "io.nix-containers.image.upstream" = "https://mariadb.org/";
      "io.nix-containers.image.category" = "database";
      "io.nix-containers.image.aliases" = "mariadb,mysql,database,sql";
    };
  };
}