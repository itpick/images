{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.python3Packages.pip;
  name = "py3-pip-wheel";
  tag = "latest";
  
  entrypoint = [ "pip" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "py3-pip-wheel";
    "org.opencontainers.image.description" = "py3-pip-wheel container image";
    "org.opencontainers.image.version" = pkgs.python3Packages.pip.version or "latest";
  };
  
  user = nonRoot.userString;
}
