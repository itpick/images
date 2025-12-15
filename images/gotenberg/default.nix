{ mkImage, pkgs, ... }:

# TODO: gotenberg requires manual configuration
# This is a placeholder - the actual package may need special handling

mkImage {
  drv = pkgs.hello;  # Placeholder
  name = "gotenberg";
  tag = "latest";
  
  labels = {
    "org.opencontainers.image.title" = "gotenberg";
    "org.opencontainers.image.description" = "Last changed 2 days ago";
  };
}
