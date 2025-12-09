{ pkgs, lib, ... }:

# TODO: Add tests for blob-csi-fips image
{
  name = "blob-csi-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for blob-csi-fips"
    exit 1
  '';
}
