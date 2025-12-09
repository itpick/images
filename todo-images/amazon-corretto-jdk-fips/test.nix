{ pkgs, lib, ... }:

# TODO: Add tests for amazon-corretto-jdk-fips image
{
  name = "amazon-corretto-jdk-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-corretto-jdk-fips"
    exit 1
  '';
}
