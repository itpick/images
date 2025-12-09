{ pkgs, lib, ... }:

# TODO: Add tests for go-fips image
{
  name = "go-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for go-fips"
    exit 1
  '';
}
