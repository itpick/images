{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.kubewatch;
  name = "kubewatch";
  tag = "latest";
  
  entrypoint = [ "kubewatch" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubewatch";
    "org.opencontainers.image.description" = "Last changed 2 days ago";
    "org.opencontainers.image.version" = pkgs.kubewatch.version;
  };
  
  user = nonRoot.userString;
}
