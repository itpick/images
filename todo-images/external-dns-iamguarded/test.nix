{ pkgs, lib, ... }:

# TODO: Add tests for external-dns-iamguarded image
{
  name = "external-dns-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for external-dns-iamguarded"
    exit 1
  '';
}
