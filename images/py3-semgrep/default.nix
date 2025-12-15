{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.semgrep;
  name = "py3-semgrep";
  tag = "latest";
  
  entrypoint = [ "semgrep" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "py3-semgrep";
    "org.opencontainers.image.description" = "py3-semgrep container image";
    "org.opencontainers.image.version" = pkgs.semgrep.version;
  };
  
  user = nonRoot.userString;
}
