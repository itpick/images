{ pkgs, lib, ... }:

# TODO: Add tests for flux-notification-controller-fips image
{
  name = "flux-notification-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-notification-controller-fips"
    exit 1
  '';
}
