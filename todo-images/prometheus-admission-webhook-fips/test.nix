{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-admission-webhook-fips image
{
  name = "prometheus-admission-webhook-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-admission-webhook-fips"
    exit 1
  '';
}
