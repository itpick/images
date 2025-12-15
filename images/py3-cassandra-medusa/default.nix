{ mkImage, pkgs, ... }:

# TODO: py3-cassandra-medusa requires manual configuration
# This is a placeholder - the actual package may need special handling

mkImage {
  drv = pkgs.hello;  # Placeholder
  name = "py3-cassandra-medusa";
  tag = "latest";
  
  labels = {
    "org.opencontainers.image.title" = "py3-cassandra-medusa";
    "org.opencontainers.image.description" = "py3-cassandra-medusa container image";
  };
}
