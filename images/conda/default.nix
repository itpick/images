{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.conda;
  name = "conda";
  tag = "v${pkgs.conda.version}";
  
  entrypoint = [ "conda" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "conda";
    "org.opencontainers.image.description" = "Last changed 23 hours ago";
    "org.opencontainers.image.version" = pkgs.conda.version;
  };
  
  user = nonRoot.userString;
}
