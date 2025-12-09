{ pkgs, lib, ... }:

# TODO: Add tests for rancher-security-scan image
{
  name = "rancher-security-scan";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for rancher-security-scan"
    exit 1
  '';
}
