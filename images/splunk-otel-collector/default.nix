{ mkImage, pkgs, lib, ... }:

# Splunk OpenTelemetry Collector
# https://github.com/signalfx/splunk-otel-collector

let
  version = "0.154.2";

  drv = pkgs.stdenv.mkDerivation {
    pname = "splunk-otel-collector";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/signalfx/splunk-otel-collector/releases/download/v${version}/otelcol_linux_amd64";
      hash = "sha256:19jq6mgkxklblz24svglj0wy7cw5qjj1h91k5zgag9dvspwb2zcr";
    };

    dontUnpack = true;

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 $src $out/bin/otelcol
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "splunk-otel-collector";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/otelcol" ];
  cmd = [ "--help" ];
  labels = {
    "org.opencontainers.image.title" = "splunk-otel-collector";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
