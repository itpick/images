{ pkgs, lib, ... }:

# TODO: Add tests for tekton-controller-fips image
{
  name = "tekton-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-controller-fips"
    exit 1
  '';
}
