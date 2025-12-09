{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-policy-reporter-ui-fips image
{
  name = "kyverno-policy-reporter-ui-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-policy-reporter-ui-fips"
    exit 1
  '';
}
