{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.kubernetes;
  name = "kubelet-1.33-default";
  tag = "latest";
  
  entrypoint = [ "kubernetes" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubelet-1.33-default";
    "org.opencontainers.image.description" = "kubelet-1.33-default container image";
    "org.opencontainers.image.version" = pkgs.kubernetes.version;
  };
  
  user = nonRoot.userString;
}
