{ mkImage, pkgs, ... }:

# TODO: kubevela-vela-cli requires manual configuration
# This is a placeholder - the actual package may need special handling

mkImage {
  drv = pkgs.hello;  # Placeholder
  name = "kubevela-vela-cli";
  tag = "latest";
  
  labels = {
    "org.opencontainers.image.title" = "kubevela-vela-cli";
    "org.opencontainers.image.description" = "kubevela-vela-cli container image";
  };
}
