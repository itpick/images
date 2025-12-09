{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-provider-kubernetes image
{
  name = "crossplane-provider-kubernetes";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-provider-kubernetes"
    exit 1
  '';
}
