{ pkgs, lib, ... }:

# TODO: Add tests for argo-cli-fips image
{
  name = "argo-cli-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argo-cli-fips"
    exit 1
  '';
}
