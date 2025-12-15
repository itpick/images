{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.vertical-pod-autoscaler;
  name = "vertical-pod-autoscaler";
  tag = "latest";
  
  entrypoint = [ "vertical-pod-autoscaler" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "vertical-pod-autoscaler";
    "org.opencontainers.image.description" = "Oops! This page doesn't exist.";
    "org.opencontainers.image.version" = pkgs.vertical-pod-autoscaler.version;
  };
  
  user = nonRoot.userString;
}
