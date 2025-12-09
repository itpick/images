{ pkgs, lib, ... }:

# TODO: Add tests for opentofu image
{
  name = "opentofu";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opentofu"
    exit 1
  '';
}
