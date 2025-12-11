{ pkgs, lib, ... }:

# TODO: Add tests for fulcio image
{
  name = "fulcio";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for fulcio"
    exit 1
  '';
}
