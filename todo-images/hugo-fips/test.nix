{ pkgs, lib, ... }:

# TODO: Add tests for hugo-fips image
{
  name = "hugo-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for hugo-fips"
    exit 1
  '';
}
