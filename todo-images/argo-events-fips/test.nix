{ pkgs, lib, ... }:

# TODO: Add tests for argo-events-fips image
{
  name = "argo-events-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argo-events-fips"
    exit 1
  '';
}
