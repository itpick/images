{ pkgs, lib, ... }:

# TODO: Add tests for karpenter-fips image
{
  name = "karpenter-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for karpenter-fips"
    exit 1
  '';
}
