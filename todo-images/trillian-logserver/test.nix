{ pkgs, lib, ... }:

# TODO: Add tests for trillian-logserver image
{
  name = "trillian-logserver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for trillian-logserver"
    exit 1
  '';
}
