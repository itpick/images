{ pkgs, lib, ... }:

# TODO: Add tests for jdk-fips image
{
  name = "jdk-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for jdk-fips"
    exit 1
  '';
}
