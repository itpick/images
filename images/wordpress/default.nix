{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.wordpress;
  name = "wordpress";
  tag = "v${pkgs.wordpress.version}";
  
  entrypoint = [ "wordpress" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "wordpress";
    "org.opencontainers.image.description" = "Last changed 2 hours ago";
    "org.opencontainers.image.version" = pkgs.wordpress.version;
  };
  
  user = nonRoot.userString;
}
