{ mkImage, pkgs, lib, ... }:

# pgpool2_exporter - Prometheus exporter for Pgpool-II
# https://github.com/pgpool/pgpool2_exporter

let
  version = "1.2.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "pgpool2_exporter";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/pgpool/pgpool2_exporter/releases/download/v${version}/pgpool2_exporter-${version}.linux-amd64.tar.gz";
      hash = "sha256:0k40irayj9fnnb95ldckpppn727wr3s9xgrv48nssys8cq0xqxbq";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = "pgpool2_exporter-${version}.linux-amd64";

    installPhase = ''
      runHook preInstall
      install -Dm755 pgpool2_exporter $out/bin/pgpool2_exporter
      runHook postInstall
    '';

    meta = with lib; {
      description = "Prometheus exporter for Pgpool-II";
      homepage = "https://github.com/pgpool/pgpool2_exporter";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };
in mkImage {
  inherit drv;
  name = "pgpool2_exporter";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/pgpool2_exporter" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "pgpool2_exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for Pgpool-II";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
