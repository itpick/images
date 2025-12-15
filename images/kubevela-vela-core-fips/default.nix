{ mkImage, pkgs, ... }:

# TODO: kubevela-vela-core-fips requires manual configuration
# This is a placeholder - the actual package may need special handling

mkImage {
  drv = pkgs.hello;  # Placeholder
  name = "kubevela-vela-core-fips";
  tag = "latest";
  
  labels = {
    "org.opencontainers.image.title" = "kubevela-vela-core-fips";
    "org.opencontainers.image.description" = "kubevela-vela-core-fips container image";
  };
}
