{ pkgs, lib, ... }:

# TODO: Add tests for rancher-security-scan-fips image
{
  name = "rancher-security-scan-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-security-scan-fips"
    exit 1
  '';
}
