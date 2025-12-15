{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.asciinema;
  name = "asciinema";
  tag = "latest";
  
  entrypoint = [ "asciinema" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "asciinema";
    "org.opencontainers.image.description" = "asciinema container image";
    "org.opencontainers.image.version" = pkgs.asciinema.version;
  };
  
  user = nonRoot.userString;
}
