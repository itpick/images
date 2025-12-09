{ pkgs, lib, ... }:

# TODO: Add tests for it-tools image
{
  name = "it-tools";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for it-tools"
    exit 1
  '';
}
