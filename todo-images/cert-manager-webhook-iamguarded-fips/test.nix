{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-webhook-iamguarded-fips image
{
  name = "cert-manager-webhook-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-webhook-iamguarded-fips"
    exit 1
  '';
}
