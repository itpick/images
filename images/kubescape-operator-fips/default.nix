{ mkImage, pkgs, ... }:

# TODO: kubescape-operator-fips requires manual configuration
# This is a placeholder - the actual package may need special handling

mkImage {
  drv = pkgs.hello;  # Placeholder
  name = "kubescape-operator-fips";
  tag = "latest";
  
  labels = {
    "org.opencontainers.image.title" = "kubescape-operator-fips";
    "org.opencontainers.image.description" = "kubescape-operator-fips";
  };
}
