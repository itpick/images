{ pkgs, lib, ... }:

# TODO: Add tests for nrdot-collector-k8s-fips image
{
  name = "nrdot-collector-k8s-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nrdot-collector-k8s-fips"
    exit 1
  '';
}
