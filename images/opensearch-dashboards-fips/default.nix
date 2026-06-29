{ mkImage, pkgs, lib, ... }:

# OpenSearch Dashboards - visualization & UI for OpenSearch
# https://github.com/opensearch-project/OpenSearch-Dashboards
# Packaged from the upstream prebuilt linux-x64 release bundle.
# NOTE: "-fips" denotes the same upstream tool; no FIPS claim is made here.

let
  version = "2.19.0";

  drv = pkgs.stdenv.mkDerivation {
    pname = "opensearch-dashboards";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://artifacts.opensearch.org/releases/bundle/opensearch-dashboards/${version}/opensearch-dashboards-${version}-linux-x64.tar.gz";
      hash = "sha256:0w677xrxvb2fdvyzn9pqkl29wfhdqrgjvsag1y5lsrfdzfwn02r9";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      openssl
    ];

    # Tarball extracts to opensearch-dashboards-${version}/
    sourceRoot = "opensearch-dashboards-${version}";

    dontStrip = true;

    installPhase = ''
      runHook preInstall
      mkdir -p $out/opensearch-dashboards
      cp -r . $out/opensearch-dashboards/
      mkdir -p $out/bin
      ln -s $out/opensearch-dashboards/bin/opensearch-dashboards $out/bin/opensearch-dashboards
      ln -s $out/opensearch-dashboards/bin/opensearch-dashboards-plugin $out/bin/opensearch-dashboards-plugin
      ln -s $out/opensearch-dashboards/bin/opensearch-dashboards-keystore $out/bin/opensearch-dashboards-keystore
      runHook postInstall
    '';

    meta = with lib; {
      description = "Visualization and user interface for OpenSearch";
      homepage = "https://github.com/opensearch-project/OpenSearch-Dashboards";
      license = licenses.asl20;
      platforms = [ "x86_64-linux" ];
    };
  };

in mkImage {
  inherit drv;
  name = "opensearch-dashboards-fips";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/opensearch-dashboards" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "opensearch-dashboards";
    "org.opencontainers.image.description" = "Visualization and user interface for OpenSearch";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
