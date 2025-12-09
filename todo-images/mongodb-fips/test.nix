{ pkgs, lib, ... }:

# TODO: Add tests for mongodb-fips image
{
  name = "mongodb-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mongodb-fips"
    exit 1
  '';
}
