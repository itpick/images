{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.unbound;
  name = "unbound";
  tag = "latest";
  
  entrypoint = [ "unbound" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "unbound";
    "org.opencontainers.image.description" = "Last changed 7 days ago";
    "org.opencontainers.image.version" = pkgs.unbound.version;
  };
  
  user = nonRoot.userString;
}
