{ pkgs, lib, ... }:

# TODO: Add tests for tekton-chains-fips image
{
  name = "tekton-chains-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-chains-fips"
    exit 1
  '';
}
