{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.steampipe;
  name = "steampipe";
  tag = "latest";
  
  entrypoint = [ "steampipe" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "steampipe";
    "org.opencontainers.image.description" = "Last changed 10 hours ago";
    "org.opencontainers.image.version" = pkgs.steampipe.version;
  };
  
  user = nonRoot.userString;
}
