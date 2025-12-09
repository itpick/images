{ pkgs, lib, ... }:

# TODO: Add tests for k3s-openssl image
{
  name = "k3s-openssl";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k3s-openssl"
    exit 1
  '';
}
