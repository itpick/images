{ pkgs, lib, ... }:

# TODO: Add tests for consul-fips image
{
  name = "consul-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for consul-fips"
    exit 1
  '';
}
