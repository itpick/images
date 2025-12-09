{ pkgs, lib, ... }:

# TODO: Add tests for aws-sigv4-proxy image
{
  name = "aws-sigv4-proxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-sigv4-proxy"
    exit 1
  '';
}
