{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vmauth-fips image
{
  name = "victoriametrics-vmauth-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vmauth-fips"
    exit 1
  '';
}
