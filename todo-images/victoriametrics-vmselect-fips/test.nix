{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vmselect-fips image
{
  name = "victoriametrics-vmselect-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vmselect-fips"
    exit 1
  '';
}
