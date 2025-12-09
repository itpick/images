{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vmagent-fips image
{
  name = "victoriametrics-vmagent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vmagent-fips"
    exit 1
  '';
}
