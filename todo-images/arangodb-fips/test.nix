{ pkgs, lib, ... }:

# TODO: Add tests for arangodb-fips image
{
  name = "arangodb-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for arangodb-fips"
    exit 1
  '';
}
