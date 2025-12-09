{ pkgs, lib, ... }:

# TODO: Add tests for k8s-wait-for-fips image
{
  name = "k8s-wait-for-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8s-wait-for-fips"
    exit 1
  '';
}
