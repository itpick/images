{ pkgs, lib, ... }:

# TODO: Add tests for contour-iamguarded-fips image
{
  name = "contour-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for contour-iamguarded-fips"
    exit 1
  '';
}
