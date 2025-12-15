{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.powershell;
  name = "powershell";
  tag = "latest";
  
  entrypoint = [ "powershell" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "powershell";
    "org.opencontainers.image.description" = "Last changed 2 days ago";
    "org.opencontainers.image.version" = pkgs.powershell.version;
  };
  
  user = nonRoot.userString;
}
