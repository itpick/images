{ pkgs, lib, ... }:

# TODO: Add tests for crane-fips image
{
  name = "crane-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crane-fips"
    exit 1
  '';
}
