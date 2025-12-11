# k8sgpt
# =============
# K8sGPT - AI-powered Kubernetes troubleshooting
# https://k8sgpt.ai/
#
# K8sGPT gives Kubernetes SRE superpowers by using AI to scan your
# clusters, diagnose issues, and triage them in simple English.

{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.k8sgpt;
  name = "k8sgpt";
  tag = "v${pkgs.k8sgpt.version}";
  entrypoint = [ "${pkgs.k8sgpt}/bin/k8sgpt" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "K8sGPT";
    "org.opencontainers.image.description" = "AI-powered Kubernetes troubleshooting";
    "org.opencontainers.image.version" = pkgs.k8sgpt.version;
  };
}
