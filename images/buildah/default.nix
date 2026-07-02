{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.buildah;
  name = "buildah";
  tag = "v${pkgs.buildah.version}";
  
  entrypoint = [ "buildah" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "buildah";
    "org.opencontainers.image.description" = "buildah container image";
    "org.opencontainers.image.version" = pkgs.buildah.version;
  };
  
  user = nonRoot.userString;
}
