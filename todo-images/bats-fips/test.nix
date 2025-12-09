{ pkgs, lib, ... }:

# TODO: Add tests for bats-fips image
{
  name = "bats-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for bats-fips"
    exit 1
  '';
}
