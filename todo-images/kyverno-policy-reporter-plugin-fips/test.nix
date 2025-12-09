{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-policy-reporter-plugin-fips image
{
  name = "kyverno-policy-reporter-plugin-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-policy-reporter-plugin-fips"
    exit 1
  '';
}
