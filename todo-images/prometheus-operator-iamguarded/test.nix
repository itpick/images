{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-operator-iamguarded image
{
  name = "prometheus-operator-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-operator-iamguarded"
    exit 1
  '';
}
