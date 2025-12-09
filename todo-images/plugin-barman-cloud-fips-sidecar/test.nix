{ pkgs, lib, ... }:

# TODO: Add tests for plugin-barman-cloud-fips-sidecar image
{
  name = "plugin-barman-cloud-fips-sidecar";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for plugin-barman-cloud-fips-sidecar"
    exit 1
  '';
}
