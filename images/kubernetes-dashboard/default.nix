{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.kubernetes-dashboard;
  name = "kubernetes-dashboard";
  tag = "latest";
  
  entrypoint = [ "kubernetes-dashboard" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubernetes-dashboard";
    "org.opencontainers.image.description" = "kubernetes-dashboard container image";
    "org.opencontainers.image.version" = pkgs.kubernetes-dashboard.version;
  };
  
  user = nonRoot.userString;
}
