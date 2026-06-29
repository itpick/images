{ mkImage, pkgs, lib, ... }:

# MySQL 8.4 LTS command-line client - upstream prebuilt Linux x86_64 binary.
# Extracts the client tools from the official "minimal" generic-linux tarball.
# https://dev.mysql.com/downloads/mysql/

let
  version = "8.4.7";
  subdir = "mysql-${version}-linux-glibc2.28-x86_64-minimal";

  drv = pkgs.stdenv.mkDerivation {
    pname = "mysql-client";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://cdn.mysql.com/Downloads/MySQL-8.4/${subdir}.tar.xz";
      hash = "sha256-VD7H0xDE8HhjRNJDZj5duemFsD50Huk1NwqwizJ08Fo=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      openssl
      ncurses
    ];

    sourceRoot = subdir;

    installPhase = ''
      runHook preInstall
      install -Dm755 bin/mysql $out/bin/mysql
      install -Dm755 bin/mysqladmin $out/bin/mysqladmin
      install -Dm755 bin/mysqldump $out/bin/mysqldump
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "MySQL 8.4 command-line client tools";
      homepage = "https://www.mysql.com";
      license = licenses.gpl2Only;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "mysql-8.4-client";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/mysql" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "mysql-8.4-client";
    "org.opencontainers.image.description" = "MySQL 8.4 command-line client";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
