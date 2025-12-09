{ pkgs, lib, ... }:

# TODO: Add tests for kyverno-notation-aws-fips image
{
  name = "kyverno-notation-aws-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kyverno-notation-aws-fips"
    exit 1
  '';
}
