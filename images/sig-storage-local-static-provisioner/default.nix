{ mkImage, pkgs, ... }:

# TODO: sig-storage-local-static-provisioner requires manual configuration
# This is a placeholder - the actual package may need special handling

mkImage {
  drv = pkgs.hello;  # Placeholder
  name = "sig-storage-local-static-provisioner";
  tag = "latest";
  
  labels = {
    "org.opencontainers.image.title" = "sig-storage-local-static-provisioner";
    "org.opencontainers.image.description" = "sig-storage-local-static-provisioner container image";
  };
}
