{ pkgs, lib, ... }:

# TODO: Add tests for ipfs-cluster-fips image
{
  name = "ipfs-cluster-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ipfs-cluster-fips"
    exit 1
  '';
}
