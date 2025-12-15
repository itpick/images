{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.csi-driver-nfs;
  name = "csi-driver-nfs";
  tag = "latest";
  
  entrypoint = [ "csi-driver-nfs" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "csi-driver-nfs";
    "org.opencontainers.image.description" = "csi-driver-nfs container image";
    "org.opencontainers.image.version" = pkgs.csi-driver-nfs.version;
  };
  
  user = nonRoot.userString;
}
