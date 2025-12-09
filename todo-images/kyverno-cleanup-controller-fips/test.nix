{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-cleanup-controller-fips image
{
  name = "kyverno-cleanup-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-cleanup-controller-fips"
    exit 1
  '';
}
