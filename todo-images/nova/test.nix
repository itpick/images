{ pkgs, lib, ... }:

# TODO: Add tests for nova image
{
  name = "nova";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nova"
    exit 1
  '';
}
