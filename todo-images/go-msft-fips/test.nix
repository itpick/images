{ pkgs, lib, ... }:

# TODO: Add tests for go-msft-fips image
{
  name = "go-msft-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for go-msft-fips"
    exit 1
  '';
}
