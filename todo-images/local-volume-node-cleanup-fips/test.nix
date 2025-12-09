{ pkgs, lib, ... }:

# TODO: Add tests for local-volume-node-cleanup-fips image
{
  name = "local-volume-node-cleanup-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for local-volume-node-cleanup-fips"
    exit 1
  '';
}
