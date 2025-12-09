{ pkgs, lib, ... }:

# TODO: Add tests for mongodb-iamguarded-fips image
{
  name = "mongodb-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for mongodb-iamguarded-fips"
    exit 1
  '';
}
