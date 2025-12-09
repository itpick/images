{ pkgs, lib, ... }:

# TODO: Add tests for kserve-rest-proxy image
{
  name = "kserve-rest-proxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kserve-rest-proxy"
    exit 1
  '';
}
