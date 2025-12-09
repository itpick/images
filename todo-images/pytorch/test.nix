{ pkgs, lib, ... }:

# TODO: Add tests for pytorch image
{
  name = "pytorch";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pytorch"
    exit 1
  '';
}
