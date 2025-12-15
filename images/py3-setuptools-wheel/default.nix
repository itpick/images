{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.python3Packages.setuptools;
  name = "py3-setuptools-wheel";
  tag = "latest";
  
  entrypoint = [ "setuptools" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "py3-setuptools-wheel";
    "org.opencontainers.image.description" = "py3-setuptools-wheel container image";
    "org.opencontainers.image.version" = setuptools.version or "latest";
  };
  
  user = nonRoot.userString;
}
