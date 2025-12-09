{ pkgs, lib, ... }:

# TODO: Add tests for kube-arangodb-fips image
{
  name = "kube-arangodb-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-arangodb-fips"
    exit 1
  '';
}
