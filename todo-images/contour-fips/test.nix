{ pkgs, lib, ... }:

# TODO: Add tests for contour-fips image
{
  name = "contour-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for contour-fips"
    exit 1
  '';
}
