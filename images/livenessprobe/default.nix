{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.csi-livenessprobe;
  name = "livenessprobe";
  tag = "latest";
  
  entrypoint = [ "csi-livenessprobe" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "livenessprobe";
    "org.opencontainers.image.description" = "livenessprobe container image";
    "org.opencontainers.image.version" = pkgs.csi-livenessprobe.version;
  };
  
  user = nonRoot.userString;
}
