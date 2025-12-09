{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-iamguarded image
{
  name = "prometheus-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-iamguarded"
    exit 1
  '';
}
