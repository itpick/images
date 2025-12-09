{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-policy-reporter-plugin-trivy-fips image
{
  name = "kyverno-policy-reporter-plugin-trivy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-policy-reporter-plugin-trivy-fips"
    exit 1
  '';
}
