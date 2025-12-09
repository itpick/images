{ pkgs, lib, ... }:

# TODO: Add tests for akhq image
{
  name = "akhq";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for akhq"
    exit 1
  '';
}
