{ pkgs, lib, ... }:

# TODO: Add tests for trivy-fips image
{
  name = "trivy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trivy-fips"
    exit 1
  '';
}
