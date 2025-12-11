{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-alertmanager image
{
  name = "prometheus-alertmanager";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-alertmanager"
    exit 1
  '';
}
