{ pkgs, lib, ... }:

# TODO: Add tests for step-ca image
{
  name = "step-ca";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for step-ca"
    exit 1
  '';
}
