{ mkImage, pkgs, lib, ... }:

# node-problem-detector - Detect node problems in Kubernetes
# https://github.com/kubernetes/node-problem-detector

mkImage {
  drv = pkgs.node-problem-detector;
  name = "node-problem-detector";
  tag = "v${pkgs.node-problem-detector.version}";
  entrypoint = [ "${pkgs.node-problem-detector}/bin/node-problem-detector" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Node Problem Detector";
    "org.opencontainers.image.description" = "Detect and report node issues in Kubernetes clusters";
    "org.opencontainers.image.version" = pkgs.node-problem-detector.version;
  };
}
