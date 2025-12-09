{ pkgs, lib, ... }:

# TODO: Add tests for vector image
{
  name = "vector";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vector"
    exit 1
  '';
}
