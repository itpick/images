{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-background-controller-fips image
{
  name = "kyverno-background-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-background-controller-fips"
    exit 1
  '';
}
