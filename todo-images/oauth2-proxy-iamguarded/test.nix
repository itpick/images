{ pkgs, lib, ... }:

# TODO: Add tests for oauth2-proxy-iamguarded image
{
  name = "oauth2-proxy-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for oauth2-proxy-iamguarded"
    exit 1
  '';
}
