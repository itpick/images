{ pkgs, lib, ... }:

# TODO: Add tests for tekton-resolvers-fips image
{
  name = "tekton-resolvers-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for tekton-resolvers-fips"
    exit 1
  '';
}
