{ pkgs, lib, ... }:

# TODO: Add tests for consul image
{
  name = "consul";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for consul"
    exit 1
  '';
}
