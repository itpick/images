{ pkgs, lib, ... }:

# TODO: Add tests for tileserver-gl-fips image
{
  name = "tileserver-gl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tileserver-gl-fips"
    exit 1
  '';
}
