# datadog-agent
# =============
# Datadog Agent - Monitoring and observability agent
# https://www.datadoghq.com/
#
# The Datadog Agent collects metrics, traces, and logs from your hosts
# and containers to send to Datadog for monitoring.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.datadog-agent;
  name = "datadog-agent";
  tag = "v${pkgs.datadog-agent.version}";
  entrypoint = [ "${pkgs.datadog-agent}/bin/agent" ];
  cmd = [ "run" ];

  extraPkgs = with pkgs; [
    bash
    coreutils
    procps
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Datadog Agent";
    "org.opencontainers.image.description" = "Monitoring and observability agent for Datadog";
    "org.opencontainers.image.version" = pkgs.datadog-agent.version;
  };
}
