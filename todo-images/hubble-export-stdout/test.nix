{ pkgs, lib, ... }:

# TODO: Add tests for hubble-export-stdout image
{
  name = "hubble-export-stdout";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for hubble-export-stdout"
    exit 1
  '';
}
