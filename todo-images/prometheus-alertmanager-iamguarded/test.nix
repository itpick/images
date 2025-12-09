{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-alertmanager-iamguarded image
{
  name = "prometheus-alertmanager-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-alertmanager-iamguarded"
    exit 1
  '';
}
