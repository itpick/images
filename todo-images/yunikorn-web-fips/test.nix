{ pkgs, lib, ... }:

# TODO: Add tests for yunikorn-web-fips image
{
  name = "yunikorn-web-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for yunikorn-web-fips"
    exit 1
  '';
}
