{ pkgs, lib, ... }:

# TODO: Add tests for nextcloud-server-fips image
{
  name = "nextcloud-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nextcloud-server-fips"
    exit 1
  '';
}
