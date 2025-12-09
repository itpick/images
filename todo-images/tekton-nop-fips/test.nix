{ pkgs, lib, ... }:

# TODO: Add tests for tekton-nop-fips image
{
  name = "tekton-nop-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-nop-fips"
    exit 1
  '';
}
