{ pkgs, lib, ... }:

# TODO: Add tests for tekton-entrypoint-fips image
{
  name = "tekton-entrypoint-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-entrypoint-fips"
    exit 1
  '';
}
