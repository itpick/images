{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-policy-reporter-fips image
{
  name = "kyverno-policy-reporter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-policy-reporter-fips"
    exit 1
  '';
}
