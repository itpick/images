{ pkgs, lib, ... }:

# TODO: Add tests for xeol image
{
  name = "xeol";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for xeol"
    exit 1
  '';
}
