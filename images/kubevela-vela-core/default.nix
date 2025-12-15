{ mkImage, pkgs, ... }:

# TODO: kubevela-vela-core requires manual configuration
# This is a placeholder - the actual package may need special handling

mkImage {
  drv = pkgs.hello;  # Placeholder
  name = "kubevela-vela-core";
  tag = "latest";
  
  labels = {
    "org.opencontainers.image.title" = "kubevela-vela-core";
    "org.opencontainers.image.description" = "kubevela-vela-core container image";
  };
}
