{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.wasmtime;
  name = "wasmtime";
  tag = "latest";
  
  entrypoint = [ "wasmtime" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "wasmtime";
    "org.opencontainers.image.description" = "Last changed 2 days ago";
    "org.opencontainers.image.version" = pkgs.wasmtime.version;
  };
  
  user = nonRoot.userString;
}
