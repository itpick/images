{ mkImage, pkgs, lib, ... }:

# Prometheus exporter for Apache HTTP Server metrics
# https://github.com/Lusitaniae/apache_exporter

let
  version = "1.1.1";

  drv = pkgs.stdenv.mkDerivation {
    pname = "apache-exporter";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/Lusitaniae/apache_exporter/releases/download/v${version}/apache_exporter-${version}.linux-amd64.tar.gz";
      hash = "sha256:032hg103f061n4qv1vgzvhqbpf8zjaa5z79xi5bv5w8px28jirp3";
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      install -Dm755 apache_exporter-${version}.linux-amd64/apache_exporter $out/bin/apache_exporter
      runHook postInstall
    '';
  };
in mkImage {
  inherit drv;
  name = "apache-exporter";
  tag = "v${version}";
  entrypoint = [ "${drv}/bin/apache_exporter" ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run the exporter
  # with its defaults: apache_exporter is pull-based, so it starts and serves
  # metrics on its default --web.listen-address :9117 (all interfaces) regardless
  # of whether the scraped Apache (default --scrape_uri
  # http://localhost/server-status/?auto) is reachable — it only scrapes on each
  # /metrics request. Operators set --scrape_uri to their Apache server-status.
  cmd = [];
  labels = {
    "org.opencontainers.image.title" = "apache-exporter";
    "org.opencontainers.image.description" = "Prometheus exporter for Apache HTTP Server metrics";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.source" = "upstream-binary";
  };
}
