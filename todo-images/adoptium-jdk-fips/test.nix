{ pkgs, lib, ... }:

# TODO: Add tests for adoptium-jdk-fips image
{
  name = "adoptium-jdk-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for adoptium-jdk-fips"
    exit 1
  '';
}
