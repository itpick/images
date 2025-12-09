{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-cli-fips image
{
  name = "kyverno-cli-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-cli-fips"
    exit 1
  '';
}
