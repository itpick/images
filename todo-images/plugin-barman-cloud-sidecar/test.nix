{ pkgs, lib, ... }:

# TODO: Add tests for plugin-barman-cloud-sidecar image
{
  name = "plugin-barman-cloud-sidecar";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for plugin-barman-cloud-sidecar"
    exit 1
  '';
}
