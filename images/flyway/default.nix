{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.flyway;
  name = "flyway";
  tag = "v${pkgs.flyway.version}";
  
  entrypoint = [ "flyway" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "flyway";
    "org.opencontainers.image.description" = "Last changed 24 hours ago";
    "org.opencontainers.image.version" = pkgs.flyway.version;
  };
  
  user = nonRoot.userString;
}
