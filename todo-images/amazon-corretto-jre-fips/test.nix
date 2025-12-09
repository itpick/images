{ pkgs, lib, ... }:

# TODO: Add tests for amazon-corretto-jre-fips image
{
  name = "amazon-corretto-jre-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-corretto-jre-fips"
    exit 1
  '';
}
