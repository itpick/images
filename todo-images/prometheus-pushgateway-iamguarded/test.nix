{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-pushgateway-iamguarded image
{
  name = "prometheus-pushgateway-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-pushgateway-iamguarded"
    exit 1
  '';
}
