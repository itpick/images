{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for fluentd:
# Packages available in nixpkgs:
#   pkgs.fluentd  # Data collector
# Note: Many Ruby-based fluentd plugins are not packaged in nixpkgs

let
  # Extract version from package name (fluentd-1.18.0 -> 1.18.0)
  version = builtins.elemAt (lib.splitString "-" pkgs.fluentd.name) 1;

  # The cmd points -c at /fluentd/etc/fluent.conf (the upstream image's config
  # path), but nothing baked that file — Fluentd exits ("config file not
  # found"). Bake a minimal config there using only core plugins: a `sample`
  # input feeding the `stdout` output, plus the `monitor_agent` HTTP endpoint on
  # 0.0.0.0:24220 (in-memory, no buffer files / writable dir). Operators mount
  # their own config with real sources/matches.
  fluentdConfig = pkgs.writeTextDir "fluentd/etc/fluent.conf" ''
    <source>
      @type sample
      tag sample
      sample {"message":"hello fluentd"}
    </source>

    <source>
      @type monitor_agent
      bind 0.0.0.0
      port 24220
    </source>

    <match **>
      @type stdout
    </match>
  '';
in
mkImage {
  drv = pkgs.fluentd;
  name = "fluentd";
  tag = "v${version}";
  entrypoint = [ "${pkgs.fluentd}/bin/fluentd" ];
  cmd = [ "-c" "/fluentd/etc/fluent.conf" ];

  extraPkgs = [ fluentdConfig ];

  env = {
    FLUENTD_CONF = "fluent.conf";
    FLUENTD_OPT = "";
  };

  labels = {
    "org.opencontainers.image.title" = "Fluentd";
    "org.opencontainers.image.description" = "Unified logging layer data collector";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "fluentd";
  };
}
