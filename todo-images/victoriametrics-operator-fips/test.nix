{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-operator-fips image
{
  name = "victoriametrics-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-operator-fips"
    exit 1
  '';
}
