{ pkgs, lib, ... }:

# TODO: Add tests for buck2 image
{
  name = "buck2";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for buck2"
    exit 1
  '';
}
