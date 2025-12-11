# kube-bench
# =============
# kube-bench - CIS Kubernetes Benchmark checker
# https://github.com/aquasecurity/kube-bench
#
# kube-bench checks whether Kubernetes is deployed according to
# security best practices defined in the CIS Kubernetes Benchmark.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.kube-bench;
  name = "kube-bench";
  tag = "v${pkgs.kube-bench.version}";
  entrypoint = [ "${pkgs.kube-bench}/bin/kube-bench" ];
  cmd = [];

  extraPkgs = with pkgs; [
    kubectl
    procps
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "kube-bench";
    "org.opencontainers.image.description" = "CIS Kubernetes Benchmark security checker";
    "org.opencontainers.image.version" = pkgs.kube-bench.version;
  };
}
