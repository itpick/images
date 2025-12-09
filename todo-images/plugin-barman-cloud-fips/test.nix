{ pkgs, lib, ... }:

# TODO: Add tests for plugin-barman-cloud-fips image
{
  name = "plugin-barman-cloud-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for plugin-barman-cloud-fips"
    exit 1
  '';
}
