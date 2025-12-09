{ pkgs, lib, ... }:

# TODO: Add tests for flux-notification-controller-iamguarded-fips image
{
  name = "flux-notification-controller-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flux-notification-controller-iamguarded-fips"
    exit 1
  '';
}
