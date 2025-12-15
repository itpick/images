{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.kubernetes;
  name = "kubelet";
  tag = "latest";
  
  entrypoint = [ "kubernetes" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubelet";
    "org.opencontainers.image.description" = "kubelet container image";
    "org.opencontainers.image.version" = pkgs.kubernetes.version;
  };
  
  user = nonRoot.userString;
}
