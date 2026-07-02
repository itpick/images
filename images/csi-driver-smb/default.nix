{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.csi-driver-smb;
  name = "csi-driver-smb";
  tag = "v${pkgs.csi-driver-smb.version}";
  
  entrypoint = [ "csi-driver-smb" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "csi-driver-smb";
    "org.opencontainers.image.description" = "csi-driver-smb container image";
    "org.opencontainers.image.version" = pkgs.csi-driver-smb.version;
  };
  
  user = nonRoot.userString;
}
