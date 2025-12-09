{ pkgs, lib, ... }:

# TODO: Add tests for akhq-fips image
{
  name = "akhq-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for akhq-fips"
    exit 1
  '';
}
