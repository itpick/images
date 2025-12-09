{ pkgs, lib, ... }:

# TODO: Add tests for valkey-fips image
{
  name = "valkey-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for valkey-fips"
    exit 1
  '';
}
