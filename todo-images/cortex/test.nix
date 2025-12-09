{ pkgs, lib, ... }:

# TODO: Add tests for cortex image
{
  name = "cortex";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cortex"
    exit 1
  '';
}
