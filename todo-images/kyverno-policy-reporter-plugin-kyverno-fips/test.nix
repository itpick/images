{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-policy-reporter-plugin-kyverno-fips image
{
  name = "kyverno-policy-reporter-plugin-kyverno-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-policy-reporter-plugin-kyverno-fips"
    exit 1
  '';
}
