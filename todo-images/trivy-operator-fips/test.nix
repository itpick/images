{ pkgs, lib, ... }:

# TODO: Add tests for trivy-operator-fips image
{
  name = "trivy-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trivy-operator-fips"
    exit 1
  '';
}
