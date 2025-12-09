{ pkgs, lib, ... }:

# TODO: Add tests for squid-proxy image
{
  name = "squid-proxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for squid-proxy"
    exit 1
  '';
}
