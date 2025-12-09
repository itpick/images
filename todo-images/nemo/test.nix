{ pkgs, lib, ... }:

# TODO: Add tests for nemo image
{
  name = "nemo";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nemo"
    exit 1
  '';
}
