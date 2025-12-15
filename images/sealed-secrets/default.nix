{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.sealed-secrets;
  name = "sealed-secrets";
  tag = "latest";
  
  entrypoint = [ "sealed-secrets" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "sealed-secrets";
    "org.opencontainers.image.description" = "sealed-secrets container image";
    "org.opencontainers.image.version" = pkgs.sealed-secrets.version;
  };
  
  user = nonRoot.userString;
}
