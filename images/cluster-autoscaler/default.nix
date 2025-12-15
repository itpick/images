{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.cluster-autoscaler;
  name = "cluster-autoscaler";
  tag = "latest";
  
  entrypoint = [ "cluster-autoscaler" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "cluster-autoscaler";
    "org.opencontainers.image.description" = "Last changed 2 days ago";
    "org.opencontainers.image.version" = pkgs.cluster-autoscaler.version;
  };
  
  user = nonRoot.userString;
}
