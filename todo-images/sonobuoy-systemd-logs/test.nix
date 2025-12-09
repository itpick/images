{ pkgs, lib, ... }:

# TODO: Add tests for sonobuoy-systemd-logs image
{
  name = "sonobuoy-systemd-logs";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for sonobuoy-systemd-logs"
    exit 1
  '';
}
