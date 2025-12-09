{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-dns-node-cache-fips image
{
  name = "kubernetes-dns-node-cache-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-dns-node-cache-fips"
    exit 1
  '';
}
