{ pkgs, lib, ... }:

# TODO: Add tests for keda-admission-webhooks-fips image
{
  name = "keda-admission-webhooks-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for keda-admission-webhooks-fips"
    exit 1
  '';
}
