{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-pushgateway image
{
  name = "prometheus-pushgateway";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-pushgateway"
    exit 1
  '';
}
