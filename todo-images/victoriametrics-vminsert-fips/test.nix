{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vminsert-fips image
{
  name = "victoriametrics-vminsert-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vminsert-fips"
    exit 1
  '';
}
