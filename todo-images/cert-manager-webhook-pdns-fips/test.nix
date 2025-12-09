{ pkgs, lib, ... }:

# TODO: Add tests for cert-manager-webhook-pdns-fips image
{
  name = "cert-manager-webhook-pdns-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cert-manager-webhook-pdns-fips"
    exit 1
  '';
}
