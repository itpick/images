{ pkgs, lib, ... }:

# TODO: Add tests for seaweedfs-fips image
{
  name = "seaweedfs-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for seaweedfs-fips"
    exit 1
  '';
}
