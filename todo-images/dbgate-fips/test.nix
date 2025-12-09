{ pkgs, lib, ... }:

# TODO: Add tests for dbgate-fips image
{
  name = "dbgate-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for dbgate-fips"
    exit 1
  '';
}
