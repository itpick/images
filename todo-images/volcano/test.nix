{ pkgs, lib, ... }:

# TODO: Add tests for volcano image
{
  name = "volcano";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for volcano"
    exit 1
  '';
}
