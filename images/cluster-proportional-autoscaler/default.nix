{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.cluster-proportional-autoscaler;
  name = "cluster-proportional-autoscaler";
  tag = "v${pkgs.cluster-proportional-autoscaler.version}";
  
  entrypoint = [ "cluster-proportional-autoscaler" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "cluster-proportional-autoscaler";
    "org.opencontainers.image.description" = "cluster-proportional-autoscaler";
    "org.opencontainers.image.version" = pkgs.cluster-proportional-autoscaler.version;
  };
  
  user = nonRoot.userString;
}
