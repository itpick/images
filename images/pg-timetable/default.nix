{ mkImage, pkgs, lib, ... }:

# pg_timetable - advanced scheduling for PostgreSQL
# https://github.com/cybertec-postgresql/pg_timetable

let
  version = "6.3.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pg-timetable";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/cybertec-postgresql/pg_timetable/releases/download/v${version}/pg_timetable_Linux_x86_64.tar.gz";
      hash = "sha256:1y5a4mfsgal43imzp6zy348rb2wjkil8ragklfw95yfnjkwqjb8w";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "pg_timetable_Linux_x86_64";

    installPhase = ''
      runHook preInstall
      install -Dm755 pg_timetable $out/bin/pg_timetable
      runHook postInstall
    '';

    meta = with lib; {
      description = "Advanced scheduling for PostgreSQL";
      homepage = "https://github.com/cybertec-postgresql/pg_timetable";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "pg-timetable";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pg_timetable" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "pg-timetable";
    "org.opencontainers.image.description" = "Advanced scheduling for PostgreSQL";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
