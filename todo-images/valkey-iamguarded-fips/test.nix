{ pkgs, lib, ... }:

# TODO: Add tests for valkey-iamguarded-fips image
{
  name = "valkey-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for valkey-iamguarded-fips"
    exit 1
  '';
}
