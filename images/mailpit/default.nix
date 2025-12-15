{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.mailpit;
  name = "mailpit";
  tag = "latest";
  
  entrypoint = [ "mailpit" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "mailpit";
    "org.opencontainers.image.description" = "Last changed 2 days ago";
    "org.opencontainers.image.version" = pkgs.mailpit.version;
  };
  
  user = nonRoot.userString;
}
