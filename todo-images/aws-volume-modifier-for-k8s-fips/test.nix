{ pkgs, lib, ... }:

# TODO: Add tests for aws-volume-modifier-for-k8s-fips image
{
  name = "aws-volume-modifier-for-k8s-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-volume-modifier-for-k8s-fips"
    exit 1
  '';
}
