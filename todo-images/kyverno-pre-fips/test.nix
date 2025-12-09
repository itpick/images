{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-pre-fips image
{
  name = "kyverno-pre-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-pre-fips"
    exit 1
  '';
}
