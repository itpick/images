{ pkgs, lib, ... }:

# TODO: Add tests for longhorn-share-manager-fips image
{
  name = "longhorn-share-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for longhorn-share-manager-fips"
    exit 1
  '';
}
