{ pkgs, lib, ... }:

# TODO: Add tests for cloudflared-fips image
{
  name = "cloudflared-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cloudflared-fips"
    exit 1
  '';
}
