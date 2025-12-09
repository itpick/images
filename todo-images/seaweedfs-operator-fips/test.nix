{ pkgs, lib, ... }:

# TODO: Add tests for seaweedfs-operator-fips image
{
  name = "seaweedfs-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for seaweedfs-operator-fips"
    exit 1
  '';
}
