{ pkgs, lib, ... }:

# TODO: Add tests for kubo-fips image
{
  name = "kubo-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubo-fips"
    exit 1
  '';
}
