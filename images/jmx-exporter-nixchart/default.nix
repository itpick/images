{ mkImage, pkgs, lib, ... }:

# jmx-exporter-nixchart
# =====================
# JMX exporter agent (prometheus/jmx_exporter) as a jar + JRE.
# Consumed by charts/kafka (as a sidecar) and any other chart that
# exposes JMX metrics via prometheus.
#
# Two ways to use:
#   1. As a Java agent: -javaagent:/opt/jmx-exporter/jmx_prometheus_javaagent.jar=<port>:<config.yml>
#   2. Standalone: `jmx_prometheus_standalone.jar <port> <config.yml>`

let
  version = "1.4.0";

  agentJar = pkgs.fetchurl {
    url = "https://github.com/prometheus/jmx_exporter/releases/download/${version}/jmx_prometheus_javaagent-${version}.jar";
    hash = "sha256-2xSS6Vp+6VzV4Klph1wNTw72QTFI11A1GkHMcdd19Zo=";
  };
  standaloneJar = pkgs.fetchurl {
    url = "https://github.com/prometheus/jmx_exporter/releases/download/${version}/jmx_prometheus_standalone-${version}.jar";
    hash = "sha256-HDBT9BTyXeunSNtGX6gmxzbfrN97jyeo9dObM1JO+Yo=";
  };

  install = pkgs.runCommand "jmx-exporter-install" {} ''
    mkdir -p $out/opt/jmx-exporter
    cp ${agentJar} $out/opt/jmx-exporter/jmx_prometheus_javaagent.jar
    cp ${standaloneJar} $out/opt/jmx-exporter/jmx_prometheus_standalone.jar
  '';

in
mkImage {
  drv = pkgs.buildEnv {
    name = "jmx-exporter-nixchart-env";
    paths = [ install pkgs.jre pkgs.bash pkgs.coreutils pkgs.cacert ];
  };

  name = "jmx-exporter-nixchart";
  tag = "v${version}";

  entrypoint = [ "${pkgs.jre}/bin/java" ];
  cmd = [
    "-jar" "/opt/jmx-exporter/jmx_prometheus_standalone.jar"
    "5556"  # default listen port (chart overrides)
    "/etc/jmx-exporter/config.yml"
  ];

  user = "1001:0";

  labels = {
    "org.opencontainers.image.title" = "jmx-exporter-nixchart";
    "org.opencontainers.image.description" = "JMX exporter (prometheus/jmx_exporter) tuned for chart use";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "any-jvm";
  };
}
