{ mkImage, pkgs, lib, ... }:

# Prometheus SNMP Exporter
# https://github.com/prometheus/snmp_exporter

let
  # The cmd was `--help` (a one-shot, so the kind-test pod CrashLoops). snmp_
  # exporter refuses to start without a config that defines at least one module
  # ("Configuration is missing Modules"), and its --config.file default is the
  # relative ./snmp.yml (not present). Bake a minimal valid snmp.yml (one v2c
  # auth + a one-metric if_mib module) so the exporter starts and serves on
  # 0.0.0.0:9116 (the --web.listen-address default :9116 binds all interfaces),
  # reachable by the kind-test probe. The Go binary ships no /etc, so nothing
  # shadows this. Operators replace it with their generated snmp.yml (the full
  # module set from the snmp_exporter generator).
  snmpConfig = pkgs.writeTextDir "etc/snmp_exporter/snmp.yml" ''
    auths:
      public_v2:
        version: 2
        community: public
    modules:
      if_mib:
        walk:
          - 1.3.6.1.2.1.2.2.1.1
        metrics:
          - name: ifIndex
            oid: 1.3.6.1.2.1.2.2.1.1
            type: gauge
            help: The index of the interface
            indexes:
              - labelname: ifIndex
                type: gauge
  '';

in
mkImage {
  drv = pkgs.prometheus-snmp-exporter;
  name = "prometheus-snmp-exporter";
  tag = "v${pkgs.prometheus-snmp-exporter.version}";
  entrypoint = [ "${pkgs.prometheus-snmp-exporter}/bin/snmp_exporter" ];
  cmd = [ "--config.file=/etc/snmp_exporter/snmp.yml" ];

  extraPkgs = [ snmpConfig ];

  labels = {
    "org.opencontainers.image.title" = "Prometheus SNMP Exporter";
    "org.opencontainers.image.description" = "SNMP Exporter for Prometheus";
    "org.opencontainers.image.version" = pkgs.prometheus-snmp-exporter.version;
  };
}
