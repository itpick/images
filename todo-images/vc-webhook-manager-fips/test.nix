{ pkgs, lib, ... }:

# TODO: Add tests for vc-webhook-manager-fips image
{
  name = "vc-webhook-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vc-webhook-manager-fips"
    exit 1
  '';
}
