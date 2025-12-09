{ pkgs, lib, ... }:

# TODO: Add tests for haproxy-iamguarded image
{
  name = "haproxy-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for haproxy-iamguarded"
    exit 1
  '';
}
