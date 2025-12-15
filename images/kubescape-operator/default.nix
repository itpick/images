{ mkImage, pkgs, ... }:

# TODO: kubescape-operator requires manual configuration
# This is a placeholder - the actual package may need special handling

mkImage {
  drv = pkgs.hello;  # Placeholder
  name = "kubescape-operator";
  tag = "latest";
  
  labels = {
    "org.opencontainers.image.title" = "kubescape-operator";
    "org.opencontainers.image.description" = "Last changed 1 day ago";
  };
}
