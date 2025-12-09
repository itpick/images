{ pkgs, lib, ... }:

# TODO: Add tests for tekton-cli-fips image
{
  name = "tekton-cli-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-cli-fips"
    exit 1
  '';
}
