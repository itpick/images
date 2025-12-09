{ pkgs, lib, ... }:

# TODO: Add tests for nova-fips image
{
  name = "nova-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nova-fips"
    exit 1
  '';
}
