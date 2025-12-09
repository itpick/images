{ pkgs, lib, ... }:

# TODO: Add tests for tekton-events-fips image
{
  name = "tekton-events-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-events-fips"
    exit 1
  '';
}
