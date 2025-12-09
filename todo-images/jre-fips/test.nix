{ pkgs, lib, ... }:

# TODO: Add tests for jre-fips image
{
  name = "jre-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jre-fips"
    exit 1
  '';
}
