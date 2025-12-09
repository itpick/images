{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-reports-controller-fips image
{
  name = "kyverno-reports-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-reports-controller-fips"
    exit 1
  '';
}
