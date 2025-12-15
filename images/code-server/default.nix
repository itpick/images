{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.code-server;
  name = "code-server";
  tag = "latest";
  
  entrypoint = [ "code-server" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "code-server";
    "org.opencontainers.image.description" = "Last changed 17 hours ago";
    "org.opencontainers.image.version" = pkgs.code-server.version;
  };
  
  user = nonRoot.userString;
}
