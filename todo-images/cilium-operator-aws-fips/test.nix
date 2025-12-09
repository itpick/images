{ pkgs, lib, ... }:

# TODO: Add tests for cilium-operator-aws-fips image
{
  name = "cilium-operator-aws-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-operator-aws-fips"
    exit 1
  '';
}
