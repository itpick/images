{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.zitadel;
  name = "zitadel";
  tag = "latest";
  
  entrypoint = [ "zitadel" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "zitadel";
    "org.opencontainers.image.description" = "Last changed 5 hours ago";
    "org.opencontainers.image.version" = pkgs.zitadel.version;
  };
  
  user = nonRoot.userString;
}
