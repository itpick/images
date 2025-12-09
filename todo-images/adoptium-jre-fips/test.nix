{ pkgs, lib, ... }:

# TODO: Add tests for adoptium-jre-fips image
{
  name = "adoptium-jre-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for adoptium-jre-fips"
    exit 1
  '';
}
