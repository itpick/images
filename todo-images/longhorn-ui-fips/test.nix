{ pkgs, lib, ... }:

# TODO: Add tests for longhorn-ui-fips image
{
  name = "longhorn-ui-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for longhorn-ui-fips"
    exit 1
  '';
}
