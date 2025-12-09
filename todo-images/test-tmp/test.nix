{ pkgs, lib, ... }:

# TODO: Add tests for test-tmp image
{
  name = "test-tmp";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for test-tmp"
    exit 1
  '';
}
