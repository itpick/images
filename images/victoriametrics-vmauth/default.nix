{ mkImage, pkgs, lib, ... }:

# VictoriaMetrics vmauth - authentication proxy and load balancer
# https://docs.victoriametrics.com/vmauth/

let
  # The upstream victoriametrics/vmauth image ships the production-build
  # binary as `/vmauth-prod` (their convention for the optimized build).
  # vm-operator's Deployment template hardcodes `exec /vmauth-prod ...`
  # in the container command, so any drop-in replacement image MUST
  # expose that path. nixpkgs ships the binary as `vmauth`, so add a
  # top-level symlink to match what the operator-generated workload
  # expects.
  prodCompat = pkgs.runCommand "vmauth-prod-compat" {} ''
    mkdir -p $out
    ln -s ${pkgs.victoriametrics}/bin/vmauth $out/vmauth-prod
  '';
in
mkImage {
  drv = pkgs.victoriametrics;
  name = "victoriametrics-vmauth";
  tag = "v${pkgs.victoriametrics.version}";
  entrypoint = [ "${pkgs.victoriametrics}/bin/vmauth" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];
  extraContents = [ prodCompat ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmauth";
    "org.opencontainers.image.description" = "Authentication proxy and load balancer";
    "org.opencontainers.image.version" = pkgs.victoriametrics.version;
    "io.nix-containers.chart" = "victoria-metrics-auth";
  };
}
