{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.node-feature-discovery;
  name = "node-feature-discovery";
  tag = "latest";
  
  entrypoint = [ "node-feature-discovery" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "node-feature-discovery";
    "org.opencontainers.image.description" = "node-feature-discovery";
    "org.opencontainers.image.version" = pkgs.node-feature-discovery.version;
  };
  
  user = nonRoot.userString;
}
