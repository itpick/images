{ pkgs, lib, ... }:

# TODO: Add tests for harbor-trivy-adapter-fips image
{
  name = "harbor-trivy-adapter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for harbor-trivy-adapter-fips"
    exit 1
  '';
}
