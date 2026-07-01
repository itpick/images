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

  # vmauth requires -auth.config or it exits, so cmd=[] CrashLoops. Bake a
  # minimal config: an unauthenticated catch-all route to a placeholder local
  # VictoriaMetrics (the Go binary ships no /etc, so no shadowing). Operators
  # mount their own auth.yml (real users + url_prefix routing).
  authConfig = pkgs.writeTextDir "etc/vmauth/auth.yml" ''
    unauthorized_user:
      url_prefix: "http://localhost:8428/"
  '';
in
mkImage {
  drv = pkgs.victoriametrics;
  name = "victoriametrics-vmauth";
  tag = "v${pkgs.victoriametrics.version}";
  entrypoint = [ "${pkgs.victoriametrics}/bin/vmauth" ];
  # Run vmauth with the baked config; bind the HTTP proxy on 0.0.0.0:8427 (its
  # default -httpListenAddr) so the kind-test probe can reach it.
  cmd = [
    "-auth.config=/etc/vmauth/auth.yml"
    "-httpListenAddr=0.0.0.0:8427"
  ];

  extraPkgs = with pkgs; [ cacert tzdata authConfig ];
  extraContents = [ prodCompat ];

  labels = {
    "org.opencontainers.image.title" = "VictoriaMetrics vmauth";
    "org.opencontainers.image.description" = "Authentication proxy and load balancer";
    "org.opencontainers.image.version" = pkgs.victoriametrics.version;
    "io.nix-containers.chart" = "victoria-metrics-auth";
  };
}
