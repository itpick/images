{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.wasmer;
  name = "wasmer";
  tag = "v${pkgs.wasmer.version}";
  
  entrypoint = [ "wasmer" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "wasmer";
    "org.opencontainers.image.description" = "Last changed 2 days ago";
    "org.opencontainers.image.version" = pkgs.wasmer.version;
  };
  
  user = nonRoot.userString;
}
