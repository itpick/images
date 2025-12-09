{ pkgs, lib, ... }:

# TODO: Add tests for argo-exec-fips image
{
  name = "argo-exec-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argo-exec-fips"
    exit 1
  '';
}
