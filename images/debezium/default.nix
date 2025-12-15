{ mkImage, pkgs, ... }:

# TODO: debezium requires manual configuration
# This is a placeholder - the actual package may need special handling

mkImage {
  drv = pkgs.hello;  # Placeholder
  name = "debezium";
  tag = "latest";
  
  labels = {
    "org.opencontainers.image.title" = "debezium";
    "org.opencontainers.image.description" = "debezium container image";
  };
}
