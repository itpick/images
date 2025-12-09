{ pkgs, lib, ... }:

# TODO: Add tests for maven-fips image
{
  name = "maven-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for maven-fips"
    exit 1
  '';
}
