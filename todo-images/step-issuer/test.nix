{ pkgs, lib, ... }:

# TODO: Add tests for step-issuer image
{
  name = "step-issuer";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for step-issuer"
    exit 1
  '';
}
