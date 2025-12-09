{ pkgs, lib, ... }:

# TODO: Add tests for tekton-sidecarlogresults-fips image
{
  name = "tekton-sidecarlogresults-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-sidecarlogresults-fips"
    exit 1
  '';
}
