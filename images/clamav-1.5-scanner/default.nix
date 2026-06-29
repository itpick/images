{ mkImage, pkgs, lib, ... }:

# ClamAV - open source antivirus engine (clamscan command-line scanner)
# https://github.com/Cisco-Talos/clamav
# Packaged from the official upstream linux x86_64 .deb release asset.

let
  version = "1.5.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "clamav-scanner";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/Cisco-Talos/clamav/releases/download/clamav-${version}/clamav-${version}.linux.x86_64.deb";
      hash = "sha256-6SsPHlUpu6pNlTSkKcTREz2/5He3YDZaET5jtUxdzXU=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.dpkg ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    unpackPhase = ''
      runHook preUnpack
      dpkg-deb -x $src clamav-root
      runHook postUnpack
    '';

    sourceRoot = "clamav-root";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin $out/lib
      cp -P usr/local/lib/*.so* $out/lib/
      install -Dm755 usr/local/bin/clamscan $out/bin/clamscan
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "clamav-1.5-scanner";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/clamscan" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "clamav-1.5-scanner";
    "org.opencontainers.image.description" = "ClamAV clamscan command-line virus scanner";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
