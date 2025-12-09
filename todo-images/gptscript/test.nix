{ pkgs, lib, ... }:

# TODO: Add tests for gptscript image
{
  name = "gptscript";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for gptscript"
    exit 1
  '';
}
