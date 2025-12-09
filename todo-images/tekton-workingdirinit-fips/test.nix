{ pkgs, lib, ... }:

# TODO: Add tests for tekton-workingdirinit-fips image
{
  name = "tekton-workingdirinit-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-workingdirinit-fips"
    exit 1
  '';
}
