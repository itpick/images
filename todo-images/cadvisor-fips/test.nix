{ pkgs, lib, ... }:

# TODO: Add tests for cadvisor-fips image
{
  name = "cadvisor-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cadvisor-fips"
    exit 1
  '';
}
