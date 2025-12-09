{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-autoscaler-addon-resizer-fips image
{
  name = "kubernetes-autoscaler-addon-resizer-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-autoscaler-addon-resizer-fips"
    exit 1
  '';
}
