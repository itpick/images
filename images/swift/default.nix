{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.swift;
  name = "swift";
  tag = "v${pkgs.swift.version}";
  
  entrypoint = [ "swift" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "swift";
    "org.opencontainers.image.description" = "Last changed 1 day ago";
    "org.opencontainers.image.version" = pkgs.swift.version;
  };
  
  user = nonRoot.userString;
}
