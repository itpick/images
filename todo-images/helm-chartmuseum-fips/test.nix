{ pkgs, lib, ... }:

# TODO: Add tests for helm-chartmuseum-fips image
{
  name = "helm-chartmuseum-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for helm-chartmuseum-fips"
    exit 1
  '';
}
