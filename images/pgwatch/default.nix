{ mkImage, pkgs, lib, ... }:

# pgwatch - flexible PostgreSQL metrics monitoring/dashboarding tool
# https://github.com/cybertec-postgresql/pgwatch

let
  version = "5.2.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pgwatch";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/cybertec-postgresql/pgwatch/releases/download/v${version}/pgwatch_Linux_x86_64.tar.gz";
      hash = "sha256:10kyjkpcnhr63lz1kxr2q64iwfwqzg8ljbfww0bqdxy29hd2xhhw";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "pgwatch_Linux_x86_64";

    installPhase = ''
      runHook preInstall
      install -Dm755 pgwatch $out/bin/pgwatch
      runHook postInstall
    '';

    meta = with lib; {
      description = "Flexible PostgreSQL metrics monitoring and dashboarding";
      homepage = "https://github.com/cybertec-postgresql/pgwatch";
      license = licenses.bsd3;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "pgwatch";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pgwatch" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "pgwatch";
    "org.opencontainers.image.description" = "PostgreSQL metrics monitoring tool";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
