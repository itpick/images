{ buildCLIImage, pkgs, lib, ... }:

buildCLIImage {
  drv = pkgs.thanos;
  name = "thanos";
  tag = "v${pkgs.thanos.version}";
  entrypoint = [ "${pkgs.thanos}/bin/thanos" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Thanos";
    "org.opencontainers.image.description" = "Highly available Prometheus setup with long-term storage";
    "org.opencontainers.image.version" = pkgs.thanos.version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
