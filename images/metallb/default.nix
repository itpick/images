{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.metallb;
  name = "metallb";
  tag = "v${pkgs.metallb.version}";
  
  entrypoint = [ "metallb" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "metallb";
    "org.opencontainers.image.description" = "metallb container image";
    "org.opencontainers.image.version" = pkgs.metallb.version;
  };
  
  user = nonRoot.userString;
}
