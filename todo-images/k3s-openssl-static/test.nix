{ pkgs, lib, ... }:

# TODO: Add tests for k3s-openssl-static image
{
  name = "k3s-openssl-static";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k3s-openssl-static"
    exit 1
  '';
}
