{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-replicator-fips image
{
  name = "kubernetes-replicator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-replicator-fips"
    exit 1
  '';
}
