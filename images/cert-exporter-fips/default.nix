{ mkImage, pkgs, lib, ... }:

# cert-exporter (fips variant) - Prometheus exporter for certificate expiry metrics
# Upstream prebuilt binary; same upstream as cert-exporter.
# https://github.com/joe-elliott/cert-exporter
let
  version = "2.18.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "cert-exporter-fips";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/joe-elliott/cert-exporter/releases/download/v${version}/cert-exporter_${version}_linux_amd64.tar.gz";
      hash = "sha256-GYBSDBD2VXIX1STMsfDkL9ZmuFA3Va8hz0HqUKIFFOg=";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 cert-exporter $out/bin/cert-exporter
      runHook postInstall
    '';
  };
in
mkImage {
  inherit drv;
  name = "cert-exporter-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/cert-exporter" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "cert-exporter-fips";
    "org.opencontainers.image.description" = "Prometheus exporter for certificate expiry metrics";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
