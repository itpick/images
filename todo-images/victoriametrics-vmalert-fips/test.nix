{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vmalert-fips image
{
  name = "victoriametrics-vmalert-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vmalert-fips"
    exit 1
  '';
}
