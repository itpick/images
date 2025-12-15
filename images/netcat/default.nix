{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.netcat;
  name = "netcat";
  tag = "latest";
  
  entrypoint = [ "netcat" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "netcat";
    "org.opencontainers.image.description" = "Last changed 7 days ago";
    "org.opencontainers.image.version" = pkgs.netcat.version;
  };
  
  user = nonRoot.userString;
}
