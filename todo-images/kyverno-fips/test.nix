{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-fips image
{
  name = "kyverno-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-fips"
    exit 1
  '';
}
