{ pkgs, lib, ... }:

# TODO: Add tests for victoriametrics-vmstorage-fips image
{
  name = "victoriametrics-vmstorage-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for victoriametrics-vmstorage-fips"
    exit 1
  '';
}
