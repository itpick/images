{ pkgs, lib, ... }:

# TODO: Add tests for openresty image
{
  name = "openresty";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openresty"
    exit 1
  '';
}
