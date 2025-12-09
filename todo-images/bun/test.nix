{ pkgs, lib, ... }:

# TODO: Add tests for bun image
{
  name = "bun";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for bun"
    exit 1
  '';
}
