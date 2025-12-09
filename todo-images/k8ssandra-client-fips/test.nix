{ pkgs, lib, ... }:

# TODO: Add tests for k8ssandra-client-fips image
{
  name = "k8ssandra-client-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8ssandra-client-fips"
    exit 1
  '';
}
